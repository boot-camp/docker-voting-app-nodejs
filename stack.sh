#!/bin/sh

#(TBD) faas

# database


# queue


# cache


# worker

docker build -t registry.gitlab.com/bootcamp-juniors/vote/worker:build-$CI_PIPELINE_ID -f ./src/worker/Dockerfile ./src/worker/.
docker push registry.gitlab.com/bootcamp-juniors/vote/worker:build-$CI_PIPELINE_ID
# app

docker build -t registry.gitlab.com/bootcamp-juniors/vote/vote:build-$CI_PIPELINE_ID -f ./src/vote/Dockerfile ./src/vote/.
docker push registry.gitlab.com/bootcamp-juniors/vote/vote:build-$CI_PIPELINE_ID
# api


# UX

# Monitoring

docker build -t registry.gitlab.com/bootcamp-juniors/vote/auditor:build-$CI_PIPELINE_ID -f ./src/auditor/Dockerfile ./src/auditor/.
docker push registry.gitlab.com/bootcamp-juniors/vote/auditor:build-$CI_PIPELINE_ID