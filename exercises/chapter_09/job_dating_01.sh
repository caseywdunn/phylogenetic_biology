#!/bin/bash

#SBATCH --job-name=dating_01
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1 
#SBATCH --cpus-per-task=1
#SBATCH -p general

module load revbayes

# See https://revbayes.github.io/tutorials/dating/global

rb scripts/MCMC_dating_ex1.Rev
