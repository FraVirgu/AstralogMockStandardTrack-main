#!/bin/bash
#SBATCH --job-name=AstralogMock
#SBATCH --output=astralog.out
#SBATCH --error=astralog.err
#SBATCH --time=01:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=2G

## Load required modules
module load cmake
module load python

## Variables
BUILD_DIR="build"
SOURCE_DIR=$SLURM_SUBMIT_DIR

## CMake build
mkdir -p $BUILD_DIR
cd $BUILD_DIR
cmake ..
cmake --build . --target install_deps
cmake --build . --target run