#!/bin/bash
set -e
set -x

./run_one.sh nrp 5,1 derivative 0.01
./run_one.sh nrp 6,1 derivative 0.01
./run_one.sh nrp 7,1 derivative 0.01
./run_one.sh nrp 8,1 derivative 0.01
./run_one.sh nrp 9,1 derivative 0.01
./run_one.sh nrp 10,1 derivative 0.01
./run_one.sh nrp 11,1 derivative 0.01
./run_one.sh nrp 12,1 derivative 0.01
./run_one.sh nrp 13,1 derivative 0.01
./run_one.sh nrp 14,1 derivative 0.01
./run_one.sh nrp 15,1 derivative 0.01
./run_herman.sh 11,10 derivative_noflip 0.01
./run_herman.sh 11,15 derivative_noflip 0.01
./run_herman.sh 13,15 derivative_noflip 0.01
./run_herman.sh 13,25 derivative_noflip 0.01
./run_herman.sh 13,35 derivative_noflip 0.01
./run_one.sh maze 25 derivative 0.01
./run_one.sh maze 1000 derivative 0.01
./run_one.sh maze 10000 derivative 0.01

./run_one.sh evade 1,2,0,1 derivative 0.01
./run_one.sh evade 1,2,1,1 derivative 0.01
./run_one.sh evade 1,2,3,1 derivative 0.01
./run_one.sh evade 1,2,0,1 derivative 0.01
./run_one.sh evade 1,2,1,2 derivative 0.01
./run_one.sh evade 1,2,3,2 derivative 0.01
