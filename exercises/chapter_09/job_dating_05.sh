#!/bin/bash

#SBATCH --job-name=dating_05
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1 
#SBATCH --cpus-per-task=1
#SBATCH -p education

module load RevBayes/1.2.2-GCC-12.2.0

# See https://revbayes.github.io/tutorials/dating/tefbd

rb scripts/MCMC_dating_ex5.Rev

