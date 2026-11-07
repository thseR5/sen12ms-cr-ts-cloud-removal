#!/bin/bash
#SBATCH     -J cr_cat --gres=gpu:1 -c 16 --mem=160G -t 02:00:00 -o logs/train_%j.out
cd "${SLURM_SUBMIT_DIR:-$PWD}"
${PYTHON:-python3} train.py --root data/asiaWest --model catformer --out runs/full_catformer_v2_s1 --epochs 40 --stage2_epochs 20 --bs 8 --seed 1
