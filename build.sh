#!/bin/bash

# Builds development container with the minimum
#   required dependencies.

#export USER="flynn"

docker build -t learn-nvim --build-arg USER=$USER .
