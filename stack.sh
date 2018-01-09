#!/bin/sh

#(TBD) faas

# database


# queue


# cache


# worker

docker build -t worker -f ./src/worker/Dockerfile .

# app

docker build -t vote -f ./src/vote/Dockerfile .

# api


# UX

# Monitoring

docker build -t auditor -f ./src/auditor/Dockerfile .
