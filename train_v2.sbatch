#!/bin/bash
#SBATCH     --gres=gpu:1 -c 16 --mem=64G -J cr_v2 -t 12:00:00 -o logs/train_%j.out
cd "${SLURM_SUBMIT_DIR:-$PWD}"
${PYTHON:-python3} train.py --root data --out runs/catformer_v2 --epochs 80 --stage2_epochs 40 --bs 8
