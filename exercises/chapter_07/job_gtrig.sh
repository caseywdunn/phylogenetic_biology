#!/bin/bash
#SBATCH --job-name=gtrig
#SBATCH --time=2:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1 
#SBATCH --cpus-per-task=8
#SBATCH -p general

#SBATCH --job-name=gtrig

rb mcmc_GTR_Gamma_Inv.Rev 
