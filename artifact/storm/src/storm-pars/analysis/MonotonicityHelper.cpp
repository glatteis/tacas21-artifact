#include "MonotonicityHelper.h"

#include "storm/exceptions/NotSupportedException.h"
#include "storm/exceptions/InvalidOperationException.h"

#include "storm/models/ModelType.h"

#include "storm/modelchecker/results/CheckResult.h"

#include "storm/modelchecker/results/ExplicitQuantitativeCheckResult.h"

#include "storm-pars/analysis/AssumptionChecker.h"


namespace storm {
    namespace analysis {
        /*** Constructor ***/
        template <typename ValueType, typename ConstantType>
        MonotonicityHelper<ValueType, ConstantType>::MonotonicityHelper(std::shared_ptr<models::sparse::Model<ValueType>> model, std::vector<std::shared_ptr<logic::Formula const>> formulas, std::vector<storage::ParameterRegion<ValueType>> regions, uint_fast64_t numberOfSamples, double const& precision, bool dotOutput) : assumptionMaker(model->getTransitionMatrix()){
            assert (model != nullptr);
            STORM_LOG_THROW(regions.size() <= 1, exceptions::NotSupportedException, "Monotonicity checking is not (yet) supported for multiple regions");
            STORM_LOG_THROW(formulas.size() <= 1, exceptions::NotSupportedException, "Monotonicity checking is not (yet) supported for multiple formulas");

            this->model = model;
            this->formulas = formulas;
            this->precision = utility::convertNumber<ConstantType>(precision);
            this->matrix = model->getTransitionMatrix();
            this->dotOutput = dotOutput;

            if (regions.size() == 1) {
                this->region = *(regions.begin());
            } else {
                typename storage::ParameterRegion<ValueType>::Valuation lowerBoundaries;
                typename storage::ParameterRegion<ValueType>::Valuation upperBoundaries;
                std::set<VariableType> vars;
                vars = models::sparse::getProbabilityParameters(*model);
                for (auto var : vars) {
                    typename storage::ParameterRegion<ValueType>::CoefficientType lb = utility::convertNumber<CoefficientType>(0 + precision) ;
                    typename storage::ParameterRegion<ValueType>::CoefficientType ub = utility::convertNumber<CoefficientType>(1 - precision) ;
                    lowerBoundaries.insert(std::make_pair(var, lb));
                    upperBoundaries.insert(std::make_pair(var, ub));
                }
                this->region = storage::ParameterRegion<ValueType>(std::move(lowerBoundaries), std::move(upperBoundaries));
            }

            if (numberOfSamples > 2) {
                // sampling
                if (model->isOfType(models::ModelType::Dtmc)) {
                            checkMonotonicityOnSamples(model->template as<models::sparse::Dtmc<ValueType>>(), numberOfSamples);
                } else if (model->isOfType(models::ModelType::Mdp)) {
                            checkMonotonicityOnSamples(model->template as<models::sparse::Mdp<ValueType>>(), numberOfSamples);
                }
                checkSamples = true;
            } else {
                if (numberOfSamples > 0) {
                    STORM_LOG_WARN("At least 3 sample points are needed to check for monotonicity on samples, not using samples for now");
                }
                checkSamples = false;
            }

            this->extender = new analysis::OrderExtender<ValueType, ConstantType>(model, formulas[0], region);

            for (auto i = 0; i < matrix.getRowCount(); ++i) {
                std::set<VariableType> occurringVariables;

                for (auto &entry : matrix.getRow(i)) {
                    storm::utility::parametric::gatherOccurringVariables(entry.getValue(), occurringVariables);
                }
                for (auto& var : occurringVariables) {
                    occuringStatesAtVariable[var].push_back(i);
                }
            }
        }


        /*** Public methods ***/
        template <typename ValueType, typename ConstantType>
        std::map<std::shared_ptr<Order>, std::pair<std::shared_ptr<MonotonicityResult<typename MonotonicityHelper<ValueType, ConstantType>::VariableType>>, std::vector<std::shared_ptr<expressions::BinaryRelationExpression>>>> MonotonicityHelper<ValueType, ConstantType>::checkMonotonicityInBuild(std::ostream& outfile, bool usePLA, std::string dotOutfileName) {
            if (usePLA) {
                storm::utility::Stopwatch plaWatch(true);
                this->extender->initializeMinMaxValues();
                plaWatch.stop();
                STORM_PRINT(std::endl << "Total time for pla checking: " << plaWatch << "." << std::endl << std::endl);
            }
            createOrder();

            //output of results
            for (auto itr : monResults) {
                if (itr.first != nullptr) {
                    std::cout << "Number of done states: " << itr.first->getNumberOfDoneStates() << std::endl;
                }
                if (checkSamples) {
                    for (auto & entry : resultCheckOnSamples.getMonotonicityResult()) {
                        if (entry.second == Monotonicity::Not) {
                            itr.second.first->updateMonotonicityResult(entry.first, entry.second, true);
                        }
                    }
                }
                std::string temp = itr.second.first->toString();
                bool first = true;
                for (auto& assumption : itr.second.second) {
                    if (!first) {
                        outfile << " & ";
                    } else {
                        outfile << "Assumptions: " << std::endl << "    ";
                        first = false;
                    }
                    outfile << *assumption;
                }
                if (!first) {
                    outfile << std::endl;
                } else {
                    outfile << "No Assumptions" << std::endl;
                }
                outfile << "Monotonicity Result: " << std::endl << "    " << temp << std::endl << std::endl;
            }

            if (monResults.size() == 0) {
                outfile << "No monotonicity found, as the order is insufficient" << std::endl;
                if (checkSamples) {
                        outfile << "Monotonicity Result on samples: " << resultCheckOnSamples.toString() << std::endl;
                }
            }

            //dotoutput
            if (dotOutput) {
                STORM_LOG_WARN_COND(monResults.size() <= 10, "Too many Reachability Orders. Dot Output will only be created for 10.");
                int i = 0;
                auto orderItr = monResults.begin();
                while (i < 10 && orderItr != monResults.end()) {
                    std::ofstream dotOutfile;
                    std::string name = dotOutfileName + std::to_string(i);
                    utility::openFile(name, dotOutfile);
                    dotOutfile << "Assumptions:" << std::endl;
                    auto assumptionItr = orderItr->second.second.begin();
                    while (assumptionItr != orderItr->second.second.end()) {
                        dotOutfile << *assumptionItr << std::endl;
                        dotOutfile << std::endl;
                        assumptionItr++;
                    }
                    dotOutfile << std::endl;
                    orderItr->first->dotOutputToFile(dotOutfile);
                    utility::closeFile(dotOutfile);
                    i++;
                    orderItr++;
                }
            }
            return monResults;
        }

        /*** Private methods ***/
        template <typename ValueType, typename ConstantType>
        void MonotonicityHelper<ValueType, ConstantType>::createOrder() {
            // Transform to Orders
            std::tuple<std::shared_ptr<Order>, uint_fast64_t, uint_fast64_t> criticalTuple;

            // Create initial order
            auto monRes = std::make_shared<MonotonicityResult<VariableType>>(MonotonicityResult<VariableType>());
            criticalTuple = extender->toOrder(region, monRes);
            // Continue based on not (yet) sorted states
            std::map<std::shared_ptr<Order>, std::vector<std::shared_ptr<expressions::BinaryRelationExpression>>> result;

            auto val1 = std::get<1>(criticalTuple);
            auto val2 = std::get<2>(criticalTuple);
            auto numberOfStates = model->getNumberOfStates();
            std::vector<std::shared_ptr<expressions::BinaryRelationExpression>> assumptions;

            if (val1 == numberOfStates && val2 == numberOfStates) {
                auto resAssumptionPair = std::pair<std::shared_ptr<MonotonicityResult<VariableType>>, std::vector<std::shared_ptr<expressions::BinaryRelationExpression>>>(monRes, assumptions);
                monResults.insert(std::pair<std::shared_ptr<Order>, std::pair<std::shared_ptr<MonotonicityResult<VariableType>>, std::vector<std::shared_ptr<expressions::BinaryRelationExpression>>>>(std::get<0>(criticalTuple), resAssumptionPair));
            } else if (val1 != numberOfStates && val2 != numberOfStates) {
                extendOrderWithAssumptions(std::get<0>(criticalTuple), val1, val2, assumptions, monRes);
            } else {
                assert (false);
            }
        }

        template <typename ValueType, typename ConstantType>
        void MonotonicityHelper<ValueType, ConstantType>::extendOrderWithAssumptions(std::shared_ptr<Order> order, uint_fast64_t val1, uint_fast64_t val2, std::vector<std::shared_ptr<expressions::BinaryRelationExpression>> assumptions, std::shared_ptr<MonotonicityResult<VariableType>> monRes) {
            std::map<std::shared_ptr<Order>, std::vector<std::shared_ptr<expressions::BinaryRelationExpression>>> result;

            auto numberOfStates = model->getNumberOfStates();
            if (val1 == numberOfStates || val2 == numberOfStates) {
                assert (val1 == val2);
                assert (order->getAddedStates().size() == order->getAddedStates().getNumberOfSetBits());
                auto resAssumptionPair = std::pair<std::shared_ptr<MonotonicityResult<VariableType>>, std::vector<std::shared_ptr<expressions::BinaryRelationExpression>>>(monRes, assumptions);
                monResults.insert(std::pair<std::shared_ptr<Order>, std::pair<std::shared_ptr<MonotonicityResult<VariableType>>, std::vector<std::shared_ptr<expressions::BinaryRelationExpression>>>>(std::move(order), std::move(resAssumptionPair)));
            } else {
                // Make the three assumptions
                STORM_LOG_INFO("Creating assumptions for " << val1 << " and " << val2 << ". ");
                auto newAssumptions = assumptionMaker.createAndCheckAssumptions(val1, val2, order, region);
                assert (newAssumptions.size() <= 3);
                auto itr = newAssumptions.begin();
                if (newAssumptions.size() == 0) {
                    monRes = std::make_shared<MonotonicityResult<VariableType>>(MonotonicityResult<VariableType>());
                    for (auto& entry : occuringStatesAtVariable) {
                        for (auto & state : entry.second) {
                            extender->checkParOnStateMonRes(state, order, entry.first, monRes);
                            if (monRes->getMonotonicity(entry.first) == Monotonicity::Unknown) {
                                break;
                            }
                        }
                        monRes->setDoneForVar(entry.first);
                    }
//                    if (monRes->existsMonotonicity()) {
                        monResults.insert({order, {monRes, assumptions}});
//                    }
                    STORM_LOG_INFO("    None of the assumptions were valid, we stop exploring the current order");
                } else {
                    STORM_LOG_INFO("    Created " << newAssumptions.size() << " assumptions, we continue extending the current order");
                }

                while (itr != newAssumptions.end()) {
                    auto assumption = *itr;
                    ++itr;
                    if (assumption.second != AssumptionStatus::INVALID) {
                        if (itr != newAssumptions.end()) {
                            // We make a copy of the order and the assumptions
                            auto orderCopy = order->copy();
                            auto assumptionsCopy = std::vector<std::shared_ptr<expressions::BinaryRelationExpression>>(assumptions);
                            auto monResCopy = monRes->copy();

                            if (assumption.second == AssumptionStatus::UNKNOWN) {
                                // only add assumption to the set of assumptions if it is unknown whether it holds or not
                                assumptionsCopy.push_back(std::move(assumption.first));
                            }
                            auto criticalTuple = extender->extendOrder(orderCopy, region, monResCopy, assumption.first);
                            extendOrderWithAssumptions(std::get<0>(criticalTuple), std::get<1>(criticalTuple), std::get<2>(criticalTuple), assumptionsCopy, monResCopy);
                        } else {
                            // It is the last one, so we don't need to create a copy.
                            if (assumption.second == AssumptionStatus::UNKNOWN) {
                                // only add assumption to the set of assumptions if it is unknown whether it holds or not
                                assumptions.push_back(std::move(assumption.first));
                            }
                            auto criticalTuple = extender->extendOrder(order, region, monRes, assumption.first);
                            extendOrderWithAssumptions(std::get<0>(criticalTuple), std::get<1>(criticalTuple), std::get<2>(criticalTuple), assumptions, monRes);
                        }
                    }
                }
            }
        }

        template <typename ValueType, typename ConstantType>
        void MonotonicityHelper<ValueType, ConstantType>::checkMonotonicityOnSamples(std::shared_ptr<models::sparse::Dtmc<ValueType>> model, uint_fast64_t numberOfSamples) {
            assert (numberOfSamples > 2);

            auto instantiator = utility::ModelInstantiator<models::sparse::Dtmc<ValueType>, models::sparse::Dtmc<ConstantType>>(*model);
            std::set<VariableType> variables = models::sparse::getProbabilityParameters(*model);
            std::vector<std::vector<ConstantType>> samples;
            // For each of the variables create a model in which we only change the value for this specific variable
            for (auto itr = variables.begin(); itr != variables.end(); ++itr) {
                ConstantType previous = -1;
                bool monDecr = true;
                bool monIncr = true;

                // Check monotonicity in variable (*itr) by instantiating the model
                // all other variables fixed on lb, only increasing (*itr)
                for (uint_fast64_t i = 0; (monDecr || monIncr) && i < numberOfSamples; ++i) {
                    // Create valuation
                    auto valuation = utility::parametric::Valuation<ValueType>();
                    for (auto itr2 = variables.begin(); itr2 != variables.end(); ++itr2) {
                        // Only change value for current variable
                        if ((*itr) == (*itr2)) {
                            auto lb = region.getLowerBoundary(itr->name());
                            auto ub = region.getUpperBoundary(itr->name());
                            // Creates samples between lb and ub, that is: lb, lb + (ub-lb)/(#samples -1), lb + 2* (ub-lb)/(#samples -1), ..., ub
                            valuation[*itr2] = utility::convertNumber<typename utility::parametric::CoefficientType<ValueType>::type>(lb + i*(ub-lb)/(numberOfSamples-1));
                        } else {
                            auto lb = region.getLowerBoundary(itr2->name());
                            valuation[*itr2] = utility::convertNumber<typename utility::parametric::CoefficientType<ValueType>::type>(lb);
                        }
                    }

                    // Instantiate model and get result
                    models::sparse::Dtmc<ConstantType> sampleModel = instantiator.instantiate(valuation);
                    auto checker = modelchecker::SparseDtmcPrctlModelChecker<models::sparse::Dtmc<ConstantType>>(sampleModel);
                    std::unique_ptr<modelchecker::CheckResult> checkResult;
                    auto formula = formulas[0];
                    if (formula->isProbabilityOperatorFormula() && formula->asProbabilityOperatorFormula().getSubformula().isUntilFormula()) {
                        const modelchecker::CheckTask<logic::UntilFormula, ConstantType> checkTask = modelchecker::CheckTask<logic::UntilFormula, ConstantType>((*formula).asProbabilityOperatorFormula().getSubformula().asUntilFormula());
                        checkResult = checker.computeUntilProbabilities(Environment(), checkTask);
                    } else if (formula->isProbabilityOperatorFormula() && formula->asProbabilityOperatorFormula().getSubformula().isEventuallyFormula()) {
                        const modelchecker::CheckTask<logic::EventuallyFormula, ConstantType> checkTask = modelchecker::CheckTask<logic::EventuallyFormula, ConstantType>((*formula).asProbabilityOperatorFormula().getSubformula().asEventuallyFormula());
                        checkResult = checker.computeReachabilityProbabilities(Environment(), checkTask);
                    } else {
                        STORM_LOG_THROW(false, exceptions::NotSupportedException, "Expecting until or eventually formula");
                    }

                    auto quantitativeResult = checkResult->asExplicitQuantitativeCheckResult<ConstantType>();
                    std::vector<ConstantType> values = quantitativeResult.getValueVector();
                    auto initialStates = model->getInitialStates();
                    ConstantType initial = 0;
                    // Get total probability from initial states
                    for (auto j = initialStates.getNextSetIndex(0); j < model->getNumberOfStates(); j = initialStates.getNextSetIndex(j + 1)) {
                        initial += values[j];
                    }
                    // Calculate difference with result for previous valuation
                    assert (initial >= 0 - precision && initial <= 1 + precision);
                    ConstantType diff = previous - initial;
                    assert (previous == -1 || diff >= -1 - precision && diff <= 1 + precision);

                    if (previous != -1 && (diff > precision || diff < -precision)) {
                        monDecr &= diff > precision; // then previous value is larger than the current value from the initial states
                        monIncr &= diff < -precision;
                    }
                    previous = initial;
                    samples.push_back(std::move(values));
                }
                auto res = (!monIncr && !monDecr) ? MonotonicityResult<VariableType>::Monotonicity::Not : MonotonicityResult<VariableType>::Monotonicity::Unknown;
                resultCheckOnSamples.addMonotonicityResult(*itr, res);
            }
            assumptionMaker.setSampleValues(std::move(samples));
        }

        template <typename ValueType, typename ConstantType>
        void MonotonicityHelper<ValueType, ConstantType>::checkMonotonicityOnSamples(std::shared_ptr<models::sparse::Mdp<ValueType>> model, uint_fast64_t numberOfSamples) {
           STORM_LOG_THROW(false, storm::exceptions::NotImplementedException, "Checking monotonicity on samples not implemented for mdps");
        }

        template class MonotonicityHelper<RationalFunction, double>;
        template class MonotonicityHelper<RationalFunction, RationalNumber>;
    }
}
