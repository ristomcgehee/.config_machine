#!/bin/bash

set -e # Exit if any command fails
set -o pipefail # Exit if any command in a pipeline fails

source export_env.sh
if [ ! -f "$HOME/.config/lyncser/globalConfig.yaml" ]; then
    sudo ansible-playbook -i hosts playbooks/lyncser.yml
    source "$HOME/.bashrc"
fi
ls -p playbooks/ | grep -v / | grep -v lyncser | xargs -I{} sudo ansible-playbook -i hosts playbooks/{}
