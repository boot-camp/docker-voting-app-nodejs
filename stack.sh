#!/bin/sh

#(TBD) faas

# database


# queue


# cache


# worker

docker build -t registry.gitlab.com/bootcamp-juniors/vote/worker -f ./src/worker/Dockerfile ./src/worker/.
docker push registry.gitlab.com/bootcamp-juniors/vote/worker:build
# app

docker build -t registry.gitlab.com/bootcamp-juniors/vote/vote -f ./src/vote/Dockerfile ./src/vote/.
docker push registry.gitlab.com/bootcamp-juniors/vote/vote:build
# api


# UX

# Monitoring

docker build -t registry.gitlab.com/bootcamp-juniors/vote/auditor -f ./src/auditor/Dockerfile ./src/vote/.
docker push registry.gitlab.com/bootcamp-juniors/vote/auditor:build