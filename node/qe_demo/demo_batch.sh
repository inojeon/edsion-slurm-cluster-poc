#!/bin/bash

python3 ${PROGRAM_HOME}/script_modeling.py --inp ${PROGRAM_HOME}/inputs/input.TOML --xsf ${PROGRAM_HOME}/inputs/input.xsf

pw.x < simulation_1.txt 
pw.x < simulation_2.txt 
bands.x < simulation_3.txt 
