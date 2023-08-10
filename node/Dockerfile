FROM ubuntu:20.04

RUN apt update -y && apt install munge vim build-essential git wget mariadb-server -y

ARG DEBIAN_FRONTEND=noninteractive
RUN apt install slurm-client slurmd -y
RUN apt install sudo -y && apt install python3.9 python3-pip -y \
    && useradd -m admin -s /usr/bin/bash -d /home/admin \
    && echo "admin:admin" | chpasswd \
    && adduser admin sudo \
    && echo "admin     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
# RUN apt install slurmd -y

COPY slurm.conf /etc/slurm-llnl/
COPY cgroup.conf /etc/slurm-llnl/
COPY docker-entrypoint.sh /etc/slurm-llnl/

EXPOSE 6817 6818 6819  

RUN apt install --no-install-recommends \
    autoconf \
    ca-certificates \
    gfortran \
    libblas3 \
    libc6 \
    libfftw3-dev \
    libgcc-s1 \
    liblapack-dev -y 


RUN set -ex \
    && wget https://gitlab.com/QEF/q-e/-/archive/qe-7.2/q-e-qe-7.2.tar.gz \
    && tar -zxvf q-e-qe-7.2.tar.gz \
    && cd q-e-qe-7.2 \
    && ./configure --prefix=/usr/local/ \
    && make all \
    && make install \
    && cd .. \
    && rm -rf q-e-qe-7.2.tar.gz q-e-qe-7.2

RUN pip3 install tomli ase

COPY qe_demo/ /PROGRAMS/qe_demo/
RUN chmod -R 755 /PROGRAMS/qe_demo/datas/*


ENTRYPOINT ["/etc/slurm-llnl/docker-entrypoint.sh"]
