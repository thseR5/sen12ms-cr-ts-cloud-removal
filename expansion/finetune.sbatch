#!/bin/bash
#SBATCH -J east_finetune
#SBATCH --gres=gpu:1
#SBATCH -c 8
#SBATCH --mem=48G
#SBATCH -t 04:00:00
#SBATCH -o logs/east_finetune_%j.out
set -euo pipefail
cd "${SLURM_SUBMIT_DIR:-$PWD}"
export OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MKL_NUM_THREADS=1
${PYTHON:-python3} expansion/cross_region.py finetune --out runs/transfer_asiaeast_s0/finetune --workers 4 --bs 4
