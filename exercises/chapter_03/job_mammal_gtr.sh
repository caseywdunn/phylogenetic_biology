#!/bin/bash

#SBATCH --job-name=mammal_gtr
#SBATCH --time=10:00

module load Seq-Gen/1.3.4-GCCcore-7.3.0

seq-gen -mGTR -f0.295,0.205,0.205,0.295 -r0.5,2,0.5,0.5,2,0.5 -s0.001 -l40 -of < mammal.tre > mammal_gtr.fa
