FROM ubuntu:20.04

RUN apt update -y && apt install munge vim build-essential git wget mariadb-server -y

ARG DEBIAN_FRONTEND=noninteractive
RUN apt install slurm-client -y
RUN apt install sudo -y && apt install python3.9 python3-pip -y \
    && useradd -m admin -s /usr/bin/bash -d /home/admin \
    && echo "admin:admin" | chpasswd \
    && adduser admin sudo \
    && echo "admin     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

COPY slurm.conf /etc/slurm-llnl/
COPY cgroup.conf /etc/slurm-llnl/
COPY docker-entrypoint.sh /etc/slurm-llnl/

WORKDIR /home/admin

EXPOSE 8000
EXPOSE 3000

ENV USER admin
ENV SHELL bash

RUN mkdir -p /server

WORKDIR /server

RUN apt install curl -y
RUN curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh
RUN sudo bash nodesource_setup.sh 
RUN apt -qq install nodejs -y
RUN npm i -g pnpm

WORKDIR /server

RUN set -ex \
    && git clone https://github.com/inojeon/slurm-api.git

WORKDIR /server/slurm-api
RUN pip3 install -r requirements.txt


WORKDIR /server
RUN set -ex \
    && git clone https://github.com/inojeon/edison-workbench.git \
    && cd edison-workbench \
    && pnpm i

COPY .env.local /server/edison-workbench/

WORKDIR /home/admin


ENTRYPOINT ["/etc/slurm-llnl/docker-entrypoint.sh"]
