#!/bin/bash
#SBATCH     --gres=gpu:1 -c 16 --mem=64G -J cr_smoke -t 01:00:00 -o logs/smoke_%j.out
cd "${SLURM_SUBMIT_DIR:-$PWD}"
${PYTHON:-python3} train.py --root data --out runs/smoke --epochs 1 --stage2_epochs 1 --max_samples 24 --bs 4
