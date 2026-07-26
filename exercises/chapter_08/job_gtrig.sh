#!/bin/bash
#SBATCH --job-name=gtrig
#SBATCH --time=2:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1 
#SBATCH --cpus-per-task=8
#SBATCH -p education

module load RevBayes/1.2.2-GCC-12.2.0

rb mcmc_GTR_Gamma_Inv.Rev 
