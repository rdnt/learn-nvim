#!/bin/bash

# Run starts the container and creates mounts
#   for persistence of the user's config files.

#export USER="flynn"
#export HOSTNAME="grid"

docker run \
    --interactive \
    --tty \
    --hostname $HOSTNAME \
    --mount type=bind,source=$PWD/.config,target=/home/$USER/.config \
    --mount type=bind,source=$PWD/.zshrc,target=/home/$USER/.zshrc \
    --mount type=bind,source=$PWD/app,target=/home/$USER/app \
    learn-nvim
