#!/bin/bash

sudo sed -i "s/REPLACE_IT/CPUs=$(nproc)/g" /etc/slurm-llnl/slurm.conf

sudo service munge start
sudo slurmd -N $(hostname)

cp -R /tmp/repository/ /home/admin/repository/
mkdir /home/admin/jobs 

tail -f /dev/null
