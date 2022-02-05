if [[ "$SLURM_ARRAY_TASK_ID" -eq 0 ]]
then
./run_one.sh evade 1,2,0,1 derivative 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 1 ]]
then
./run_one.sh evade 1,2,1,1 derivative 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 2 ]]
then
./run_one.sh evade 1,2,3,1 derivative 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 3 ]]
then
./run_one.sh evade 1,2,0,1 derivative 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 4 ]]
then
./run_one.sh evade 1,2,1,2 derivative 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 5 ]]
then
./run_one.sh evade 1,2,3,2 derivative 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 6 ]]
then
./run_one.sh nrp 5,1 derivative 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 7 ]]
then
./run_one.sh nrp 6,1 derivative 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 8 ]]
then
./run_one.sh nrp 7,1 derivative 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 9 ]]
then
./run_one.sh nrp 8,1 derivative 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 10 ]]
then
./run_one.sh nrp 9,1 derivative 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 11 ]]
then
./run_one.sh nrp 10,1 derivative 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 12 ]]
then
./run_one.sh nrp 11,1 derivative 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 13 ]]
then
./run_one.sh nrp 12,1 derivative 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 14 ]]
then
./run_one.sh nrp 13,1 derivative 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 15 ]]
then
./run_one.sh nrp 14,1 derivative 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 16 ]]
then
./run_one.sh nrp 15,1 derivative 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 17 ]]
then
./run_herman.sh 11,10 derivative_noflip 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 18 ]]
then
./run_herman.sh 11,15 derivative_noflip 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 19 ]]
then
./run_herman.sh 13,15 derivative_noflip 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 20 ]]
then
./run_herman.sh 13,25 derivative_noflip 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 21 ]]
then
./run_herman.sh 13,35 derivative_noflip 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 22 ]]
then
./run_one.sh maze 25 derivative 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 23 ]]
then
./run_one.sh maze 1000 derivative 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 24 ]]
then
./run_one.sh maze 10000 derivative 0.05#!/bin/bash

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 25 ]]
then
./run_one.sh nrp 5,1 derivative 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 26 ]]
then
./run_one.sh nrp 6,1 derivative 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 27 ]]
then
./run_one.sh nrp 7,1 derivative 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 28 ]]
then
./run_one.sh nrp 8,1 derivative 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 29 ]]
then
./run_one.sh nrp 9,1 derivative 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 30 ]]
then
./run_one.sh nrp 10,1 derivative 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 31 ]]
then
./run_one.sh nrp 11,1 derivative 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 32 ]]
then
./run_one.sh nrp 12,1 derivative 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 33 ]]
then
./run_one.sh nrp 13,1 derivative 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 34 ]]
then
./run_one.sh nrp 14,1 derivative 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 35 ]]
then
./run_one.sh nrp 15,1 derivative 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 36 ]]
then
./run_one.sh evade 1,2,0,1 derivative 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 37 ]]
then
./run_one.sh evade 1,2,1,1 derivative 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 38 ]]
then
./run_one.sh evade 1,2,3,1 derivative 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 39 ]]
then
./run_one.sh evade 1,2,0,1 derivative 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 40 ]]
then
./run_one.sh evade 1,2,1,2 derivative 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 41 ]]
then
./run_one.sh evade 1,2,3,2 derivative 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 42 ]]
then
./run_herman.sh 11,10 derivative_noflip 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 43 ]]
then
./run_herman.sh 11,15 derivative_noflip 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 44 ]]
then
./run_herman.sh 13,15 derivative_noflip 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 45 ]]
then
./run_herman.sh 13,25 derivative_noflip 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 46 ]]
then
./run_herman.sh 13,35 derivative_noflip 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 47 ]]
then
./run_one.sh maze 25 derivative 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 48 ]]
then
./run_one.sh maze 1000 derivative 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 49 ]]
then
./run_one.sh maze 10000 derivative 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 50 ]]
then
./run_one.sh nrp 5,1 vanilla 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 51 ]]
then
./run_one.sh nrp 6,1 vanilla 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 52 ]]
then
./run_one.sh nrp 7,1 vanilla 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 53 ]]
then
./run_one.sh nrp 8,1 vanilla 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 54 ]]
then
./run_one.sh nrp 9,1 vanilla 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 55 ]]
then
./run_one.sh nrp 10,1 vanilla 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 56 ]]
then
./run_one.sh nrp 11,1 vanilla 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 57 ]]
then
./run_one.sh nrp 12,1 vanilla 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 58 ]]
then
./run_one.sh nrp 13,1 vanilla 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 59 ]]
then
./run_one.sh nrp 14,1 vanilla 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 60 ]]
then
./run_one.sh nrp 15,1 vanilla 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 61 ]]
then
./run_one.sh evade 1,2,0,1 vanilla 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 62 ]]
then
./run_one.sh evade 1,2,1,1 vanilla 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 63 ]]
then
./run_one.sh evade 1,2,3,1 vanilla 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 64 ]]
then
./run_one.sh evade 1,2,0,1 vanilla 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 65 ]]
then
./run_one.sh evade 1,2,1,2 vanilla 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 66 ]]
then
./run_one.sh evade 1,2,3,2 vanilla 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 67 ]]
then
./run_herman.sh 11,10 vanilla 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 68 ]]
then
./run_herman.sh 11,15 vanilla 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 69 ]]
then
./run_herman.sh 13,15 vanilla 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 70 ]]
then
./run_herman.sh 13,25 vanilla 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 71 ]]
then
./run_herman.sh 13,35 vanilla 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 72 ]]
then
./run_one.sh maze 25 vanilla 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 73 ]]
then
./run_one.sh maze 1000 vanilla 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 74 ]]
then
./run_one.sh maze 10000 vanilla 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 75 ]]
then
./run_one.sh nrp 5,1 vanilla 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 76 ]]
then
./run_one.sh nrp 6,1 vanilla 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 77 ]]
then
./run_one.sh nrp 7,1 vanilla 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 78 ]]
then
./run_one.sh nrp 8,1 vanilla 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 79 ]]
then
./run_one.sh nrp 9,1 vanilla 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 80 ]]
then
./run_one.sh nrp 10,1 vanilla 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 81 ]]
then
./run_one.sh nrp 11,1 vanilla 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 82 ]]
then
./run_one.sh nrp 12,1 vanilla 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 83 ]]
then
./run_one.sh nrp 13,1 vanilla 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 84 ]]
then
./run_one.sh nrp 14,1 vanilla 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 85 ]]
then
./run_one.sh nrp 15,1 vanilla 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 86 ]]
then
./run_one.sh evade 1,2,0,1 vanilla 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 87 ]]
then
./run_one.sh evade 1,2,1,1 vanilla 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 88 ]]
then
./run_one.sh evade 1,2,3,1 vanilla 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 89 ]]
then
./run_one.sh evade 1,2,0,1 vanilla 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 90 ]]
then
./run_one.sh evade 1,2,1,2 vanilla 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 91 ]]
then
./run_one.sh evade 1,2,3,2 vanilla 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 92 ]]
then
./run_herman.sh 11,10 vanilla 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 93 ]]
then
./run_herman.sh 11,15 vanilla 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 94 ]]
then
./run_herman.sh 13,15 vanilla 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 95 ]]
then
./run_herman.sh 13,25 vanilla 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 96 ]]
then
./run_herman.sh 13,35 vanilla 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 97 ]]
then
./run_one.sh maze 25 vanilla 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 98 ]]
then
./run_one.sh maze 1000 vanilla 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 99 ]]
then
./run_one.sh maze 10000 vanilla 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 100 ]]
then
./run_one.sh evade 1,2,0,1 integrated 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 101 ]]
then
./run_one.sh evade 1,2,1,1 integrated 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 102 ]]
then
./run_one.sh evade 1,2,3,1 integrated 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 103 ]]
then
./run_one.sh evade 1,2,0,1 integrated 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 104 ]]
then
./run_one.sh evade 1,2,1,2 integrated 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 105 ]]
then
./run_one.sh evade 1,2,3,2 integrated 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 106 ]]
then
./run_herman.sh 11,10 integrated 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 107 ]]
then
./run_herman.sh 11,15 integrated 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 108 ]]
then
./run_herman.sh 13,15 integrated 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 109 ]]
then
./run_herman.sh 13,25 integrated 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 110 ]]
then
./run_herman.sh 13,35 integrated 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 111 ]]
then
./run_one.sh maze 25 integrated 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 112 ]]
then
./run_one.sh maze 1000 integrated 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 113 ]]
then
./run_one.sh maze 10000 integrated 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 114 ]]
then
./run_one.sh nrp 5,1 integrated 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 115 ]]
then
./run_one.sh nrp 6,1 integrated 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 116 ]]
then
./run_one.sh nrp 7,1 integrated 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 117 ]]
then
./run_one.sh nrp 8,1 integrated 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 118 ]]
then
./run_one.sh nrp 9,1 integrated 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 119 ]]
then
./run_one.sh nrp 10,1 integrated 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 120 ]]
then
./run_one.sh nrp 11,1 integrated 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 121 ]]
then
./run_one.sh nrp 12,1 integrated 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 122 ]]
then
./run_one.sh nrp 13,1 integrated 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 123 ]]
then
./run_one.sh nrp 14,1 integrated 0.05

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 124 ]]
then
./run_one.sh nrp 15,1 integrated 0.05#!/bin/bash

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 125 ]]
then
./run_one.sh nrp 5,1 integrated 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 126 ]]
then
./run_one.sh nrp 6,1 integrated 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 127 ]]
then
./run_one.sh nrp 7,1 integrated 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 128 ]]
then
./run_one.sh nrp 8,1 integrated 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 129 ]]
then
./run_one.sh nrp 9,1 integrated 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 130 ]]
then
./run_one.sh nrp 10,1 integrated 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 131 ]]
then
./run_one.sh nrp 11,1 integrated 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 132 ]]
then
./run_one.sh nrp 12,1 integrated 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 133 ]]
then
./run_one.sh nrp 13,1 integrated 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 134 ]]
then
./run_one.sh nrp 14,1 integrated 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 135 ]]
then
./run_one.sh nrp 15,1 integrated 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 136 ]]
then
./run_one.sh evade 1,2,0,1 integrated 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 137 ]]
then
./run_one.sh evade 1,2,1,1 integrated 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 138 ]]
then
./run_one.sh evade 1,2,3,1 integrated 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 139 ]]
then
./run_one.sh evade 1,2,0,1 integrated 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 140 ]]
then
./run_one.sh evade 1,2,1,2 integrated 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 141 ]]
then
./run_one.sh evade 1,2,3,2 integrated 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 142 ]]
then
./run_herman.sh 11,10 integrated 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 143 ]]
then
./run_herman.sh 11,15 integrated 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 144 ]]
then
./run_herman.sh 13,15 integrated 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 145 ]]
then
./run_herman.sh 13,25 integrated 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 146 ]]
then
./run_herman.sh 13,35 integrated 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 147 ]]
then
./run_one.sh maze 25 integrated 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 148 ]]
then
./run_one.sh maze 1000 integrated 0.1

fi
if [[ "$SLURM_ARRAY_TASK_ID" -eq 149 ]]
then
./run_one.sh maze 10000 integrated 0.1
fi
