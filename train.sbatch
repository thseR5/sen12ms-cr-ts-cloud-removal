#!/bin/bash
#SBATCH -J cr_train     --gres=gpu:1 -c 16 --mem=64G -t 10:00:00 -o logs/train_%j.out
cd "${SLURM_SUBMIT_DIR:-$PWD}"
nvidia-smi --query-gpu=name,memory.total --format=csv
${PYTHON:-python3} train.py --root data --out runs/catformer_v1_s2cl --epochs 80 --bs 8
