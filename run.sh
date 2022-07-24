#!/bin/bash

# Run starts the container and creates mounts
#   for persistence of the user's config files.

docker run \
    -it \
    --mount type=bind,source=$PWD/.config,target=/home/tasos/.config \
    --mount type=bind,source=$PWD/.zshrc,target=/home/tasos/.zshrc \
    --mount type=bind,source=$PWD/app,target=/home/tasos/app \
    learn-nvim