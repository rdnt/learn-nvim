#!/bin/bash

# This bootstrap script sets up the container
#   to be a usable development environment.

# add nodesource repo
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo bash -

sudo apt-get install -y --no-install-recommends \
  golang-go \
  nodejs

go install -v golang.org/x/tools/gopls@latest
