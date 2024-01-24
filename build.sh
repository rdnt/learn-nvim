#!/bin/bash

# Builds development container with the minimum
#   required dependencies.

#export USER="flynn"
DATE=$(bash -c 'date +%Z')
docker build -t learn-nvim --build-arg USER=$USER --build-arg TZ=$DATE .
