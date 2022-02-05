#!/bin/bash
set -e
set -x

./run_all_integrated_0.1.sh
./run_all_integrated_0.05.sh
./run_all_vanilla_0.1.sh
./run_all_vanilla_0.05.sh
./run_all_derivative_0.1.sh
./run_all_derivative_0.05.sh
