#!/bin/bash
#SBATCH -J east_zero_shot
#SBATCH --gres=gpu:1
#SBATCH -c 8
#SBATCH --mem=48G
#SBATCH -t 01:00:00
#SBATCH -o logs/east_zero_shot_%j.out
set -euo pipefail
cd "${SLURM_SUBMIT_DIR:-$PWD}"
export OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MKL_NUM_THREADS=1
${PYTHON:-python3} expansion/cross_region.py zero_shot --out runs/transfer_asiaeast_s0/zero_shot --workers 4 --bs 4
