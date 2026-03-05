#!/bin/bash
#SBATCH -p short
#SBATCH --time=00:05:00
#SBATCH --cpus-per-task=8
#SBATCH --mem=20G
#SBATCH --gres=gpu:mi300x:1
#SBATCH --mail-user=des.ryan@sheffield.ac.uk
#SBATCH --mail-type=ALL
module load rocm
export C_COMPILER=amdclang
#HSA_XNACK=1 required when using GPu without memory mapping
export HSA_XNACK=1
make clean
make
srun ./saxpy
