#!/bin/bash

set -e # Exit if any command fails

sudo apt-get install -y \
    git \
    python3-apt \
    python3-pip
sudo pip3 install ansible

CONFIG_DIR=~/.config/ristomcgehee/.config_machine
mkdir -p $CONFIG_DIR
git clone https://github.com/ristomcgehee/.config_machine.git $CONFIG_DIR
cd $CONFIG_DIR
./execute_playbooks.sh
