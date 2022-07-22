#!/bin/bash
clear
docker run \
    -it \
    --mount type=bind,source=$PWD/.config,target=/home/tasos/.config \
    --mount type=bind,source=$PWD/.zshrc,target=/home/tasos/.zshrc \
    --mount type=bind,source=$PWD/app,target=/home/tasos/app \
    learn-nvim