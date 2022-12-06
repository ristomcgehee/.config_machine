#!/bin/bash

set -e # Exit if any command fails
set -o pipefail # Exit if any command in a pipeline fails

source export_env.sh
ls -p playbooks/ | grep -v /  | xargs -I{} sudo ansible-playbook -i hosts playbooks/{}
