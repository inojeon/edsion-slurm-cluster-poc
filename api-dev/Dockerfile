FROM ubuntu:20.04

RUN apt update -y && apt install munge vim build-essential git wget mariadb-server -y

ARG DEBIAN_FRONTEND=noninteractive
RUN apt install slurm-client -y
RUN apt install sudo -y && apt install python3.9 python3-pip -y \
    && useradd -m admin -s /usr/bin/bash -d /home/admin \
    && echo "admin:admin" | chpasswd \
    && adduser admin sudo \
    && echo "admin     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1

COPY slurm.conf /etc/slurm-llnl/
COPY cgroup.conf /etc/slurm-llnl/
COPY docker-entrypoint.sh /etc/slurm-llnl/

RUN pip3 install fastapi "uvicorn[standard]" multiport gunicorn Jinja2

WORKDIR /home/admin

ENV USER admin
ENV SHELL bash

EXPOSE 8000

ENTRYPOINT ["/etc/slurm-llnl/docker-entrypoint.sh"]
