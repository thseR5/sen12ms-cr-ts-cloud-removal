#!/bin/bash
#SBATCH     -J cr_cache -c 32 --mem=64G -t 04:00:00 -o logs/cache_%j.out
cd "${SLURM_SUBMIT_DIR:-$PWD}"
${PYTHON:-python3} cache_clouds.py data/asiaWest 32
