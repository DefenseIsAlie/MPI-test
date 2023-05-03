#!/bin/bash
#SBATCH --job-name=MPI_JOB    	      # Job name
#SBATCH --mail-type=END,FAIL          # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=200010021@iitdh.ac.in # Where to send mail	
#SBATCH --nodes=1                     # Run on 2 nodes
#SBATCH --cpus-per-task=1             # 1 cpu per task
#SBATCH --time=00:5:00               # Time limit hrs:min:sec
#SBATCH --output=test_%j.log   # Standard output and error log
#SBATCH --partition=test   # Queuename
#SBATCH -n 4    # Must be a perfect square

pwd; hostname; date
export I_MPI_PMI_LIBRARY=/usr/lib64/libpmi.so
srun ./test 
date


