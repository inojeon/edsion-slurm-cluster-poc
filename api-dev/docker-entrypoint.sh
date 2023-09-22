#!/bin/bash

sudo service munge start

cd /slurm-api/src
gunicorn --bind 0:8000 app.main:app --worker-class uvicorn.workers.UvicornWorker