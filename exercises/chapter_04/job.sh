#!/bin/bash
#SBATCH --job-name=iqtree
#SBATCH --time=2:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1 
#SBATCH --cpus-per-task=8
#SBATCH -p general

module load IQ-TREE

iqtree -s siph16s.phy -nt AUTO
