#!/bin/bash -l

#SBATCH --job-name=example
#SBATCH --nodes=1
#SBATCH -e std-%j.err
#SBATCH -o std-%j.out

export PROGRAM_HOME=/PROGRAMS/qe_demo

python3 ${PROGRAM_HOME}/script_modeling.py ${PROGRAM_HOME}/inputs/input.TOML ${PROGRAM_HOME}/inputs/input.xsf

pw.x < simulation_1.txt 
pw.x < simulation_2.txt 
bands.x < simulation_3.txt 