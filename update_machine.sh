#!/bin/bash

set -e # Exit if any command fails

CONFIG_DIR=~/.config/chrismcgehee/.config_machine
cd $CONFIG_DIR
git pull --rebase
source export_env.sh
ls playbooks/ | xargs -I{} sudo ansible-playbook -i hosts playbooks/{}
