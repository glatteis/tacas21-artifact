#!/bin/bash
set -e
set -x

../../../storm/build/bin/storm-pars --prism ./models/herman_$1.pm --prop ./properties/property_herman.prctl $(< options/options_all.txt) $(< options/options_$2_$3.txt) > output/output_herman_$1_$2_$3
