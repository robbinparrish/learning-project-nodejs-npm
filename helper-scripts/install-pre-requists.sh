#!/bin/bash
#
# Install pre-requists those mostly requires during CI pipeline build.
#

# Fail on error.
set -e

export DEBIAN_FRONTEND=noninteractive

# Install common utilities and tools.
apt-get update
apt-get install -y --no-install-recommends --no-install-suggests \
        curl wget tar zip bzip2 unzip ca-certificates gnupg git

# Install nodejs LTS version.
mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
apt-get update
apt-get install -y --no-install-recommends --no-install-suggests nodejs

# Install Chrome Browser for performing headless tests..
apt-get update
apt-get install -y --no-install-recommends --no-install-suggests fonts-liberation

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt-get install -y --no-install-recommends --no-install-suggests -f ./*.deb

