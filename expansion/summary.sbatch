#!/bin/bash
#SBATCH -J east_summary
#SBATCH -c 4
#SBATCH --mem=12G
#SBATCH -t 00:20:00
#SBATCH -o logs/east_summary_%j.out
set -euo pipefail
cd "${SLURM_SUBMIT_DIR:-$PWD}"
export OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1
${PYTHON:-python3} expansion/summarize_transfer.py
