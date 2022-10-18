#!/bin/bash
#SBATCH --job-name=gtr
#SBATCH --time=2:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1 
#SBATCH --cpus-per-task=8
#SBATCH -p general

module load revbayes

rb mcmc_GTR.Rev 
