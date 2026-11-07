#!/bin/bash
#SBATCH -J cr_full_eda
#SBATCH -c 16
#SBATCH --mem=32G
#SBATCH -t 04:00:00
#SBATCH -o logs/full_eda_%j.out
set -euo pipefail
cd "${SLURM_SUBMIT_DIR:-$PWD}"
export OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1
${PYTHON:-python3} expansion/full_eda.py --root data --out eda/full --workers 16
