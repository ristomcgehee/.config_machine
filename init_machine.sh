#!/bin/bash

set -e # Exit if any command fails

sudo apt-get install - y \
    git \
    python3-apt \
    python3-pip
sudo pip3 install ansible

mkdir -p ~/.config/chrismcgehee/.config_machine
git clone https://github.com/chrismcgehee/.config_machine.git ~/.config/chrismcgehee/.config_machine
