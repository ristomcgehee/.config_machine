#!/bin/bash

set -e # Exit if any command fails

CONFIG_DIR=~/.config/chrismcgehee/.config_machine
cd $CONFIG_DIR
git pull --rebase
ls playbooks/ | xargs -I{} sudo ansible-playbook -i hosts playbooks/{}
