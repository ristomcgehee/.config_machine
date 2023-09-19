#!/bin/bash

set -e # Exit if any command fails
set -o pipefail # Exit if any command in a pipeline fails

hosts_file=$1

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR

sudo pip install -r requirements.txt

source export_env.sh
if [ ! -f "$HOME/.config/lyncser/globalConfig.yaml" ]; then
    sudo -E ansible-playbook -i $hosts_file playbooks/lyncser.yml
    source "$HOME/.bashrc"
fi
ls -p playbooks/ | grep -v / | grep -v lyncser | xargs -I{} sudo ansible-playbook -i $hosts_file playbooks/{}
