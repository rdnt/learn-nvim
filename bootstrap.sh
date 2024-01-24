#!/bin/bash

# This bootstrap script sets up the container
#   to be a usable development environment.

# add nodesource repo
#curl -fsSL https://deb.nodesource.com/setup_18.x | sudo bash -

#sudo apt-get install -y --no-install-recommends \
#  golang-go \
#  nodejs

wget https://go.dev/dl/go1.21.6.linux-amd64.tar.gz
sudo tar -xvf go1.21.6.linux-amd64.tar.gz
sudo mv go /usr/local

/usr/local/go/bin/go install -v golang.org/x/tools/gopls@latest
