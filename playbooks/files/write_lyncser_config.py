#!/usr/bin/env python3

import base64
import json
import os
import subprocess

# Run a shell command
def run(cmd):
    return subprocess.run(cmd, shell=True, check=True, capture_output=True).stdout.decode('utf-8').strip()

home_dir = os.path.expanduser('~' . run('logname'))
os.chdir(home_dir)
lyncser_json_base64 = os.environ['LYNCSER_JSON_BASE64']
lyncser_json = base64.b64decode(lyncser_json_base64).decode('utf-8')
for key, value in json.loads(lyncser_json).items():
    with open(key, 'w') as f:
        f.write(value)
    os.chmod(key, 0o600)
