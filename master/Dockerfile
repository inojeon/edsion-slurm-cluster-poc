FROM ubuntu:20.04

RUN apt update -y && apt install munge vim build-essential git wget mariadb-server -y

#RUN apt update -y && apt install munge -y && apt install vim -y && apt install build-essential -y && apt install git -y && apt-get install mariadb-server -y && apt install wget -y

ARG DEBIAN_FRONTEND=noninteractive
RUN apt install slurmd slurm-client slurmctld -y
RUN apt install sudo -y && apt install python3.9 python3-pip -y \
    && useradd -m admin -s /usr/bin/bash -d /home/admin \
    && echo "admin:admin" | chpasswd \
    && adduser admin sudo \
    && echo "admin     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
# RUN apt update -y && apt install libopenmpi-dev -y && pip3 install mpi4py

RUN sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1

COPY slurm.conf /etc/slurm-llnl/
COPY cgroup.conf /etc/slurm-llnl/
COPY docker-entrypoint.sh /etc/slurm-llnl/

EXPOSE 6817 6818 6819 3306 

WORKDIR /home/admin

ENTRYPOINT ["/etc/slurm-llnl/docker-entrypoint.sh"]
