#!/bin/bash
set -e
set -x

../../../storm/build/bin/storm-pars --explicit-drn ./models/$1_$2.drn --prop ./properties/property_$1.prctl $(< options/options_all.txt) $(< options/options_$3_$4.txt) > output/output_$1_$2_$3_$4.txt