#!/bin/bash
#SBATCH -p short
#SBATCH --time=00:05:00
#SBATCH --cpus-per-task=2
#SBATCH --mem=20G
#SBATCH --gres=gpu:mi300x:1
#SBATCH --mail-user=des.ryan@sheffield.ac.uk
#SBATCH --mail-type=ALL
module load rocm
export C_COMPILER=amdclang
#export HSA_XNACK=1
make clean
make
export OMP_NUM_THREADS=2
srun ./saxpy
