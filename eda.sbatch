#!/bin/bash
#SBATCH -J cr_eda     -c 8 --mem=32G -t 02:00:00 -o logs/eda_%j.out
cd "${SLURM_SUBMIT_DIR:-$PWD}"
${PYTHON:-python3} eda.py --root data --out eda --max_locs 300
