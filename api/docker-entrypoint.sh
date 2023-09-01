#!/bin/bash

sudo service munge start


/bin/bash


cd /server/slurm-api/src
gunicorn --bind 0:8000 app.main:app --worker-class uvicorn.workers.UvicornWorker --daemon

cd /server/edison-workbench
pnpm dev

tail -f /dev/null
