#!/bin/bash
#SBATCH     -J cr_unc --gres=gpu:1 -c 16 --mem=160G -t 02:00:00 -o logs/train_%j.out
cd "${SLURM_SUBMIT_DIR:-$PWD}"
${PYTHON:-python3} train.py --root data/asiaWest --model uncrtaints --out runs/full_uncrtaints_s2 --epochs 40 --bs 8 --lr 1e-3 --seed 2
