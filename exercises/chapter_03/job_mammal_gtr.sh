#!/bin/bash
#SBATCH --job-name=seq-gen
#SBATCH --time=2:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1 
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=1G
#SBATCH -p education

module load Seq-Gen

seq-gen -mGTR -f0.295,0.205,0.205,0.295 -r0.5,2,0.5,0.5,2,0.5 -s0.001 -l40 -of < mammal.tre > mammal_gtr.fa
