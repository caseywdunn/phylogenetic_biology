#!/bin/bash
#SBATCH --job-name=jc
#SBATCH --time=2:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1 
#SBATCH --cpus-per-task=8
#SBATCH -p education

module load RevBayes

rb mcmc_JC.Rev 
