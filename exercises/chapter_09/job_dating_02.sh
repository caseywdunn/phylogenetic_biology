#!/bin/bash

#SBATCH --job-name=dating_02
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1 
#SBATCH --cpus-per-task=1
#SBATCH -p general

module load revbayes

# See https://revbayes.github.io/tutorials/dating/relaxed

rb scripts/MCMC_dating_ex2.Rev
rb scripts/MCMC_dating_ex2b.Rev
