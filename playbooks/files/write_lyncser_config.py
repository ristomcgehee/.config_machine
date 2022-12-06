#!/usr/bin/env python3

import base64
import json
import os

os.chdir(os.environ['HOME'] + '/.config/lyncser')
lyncser_json_base64 = os.environ['LYNCSER_JSON_BASE64']
lyncser_json = base64.b64decode(lyncser_json_base64).decode('utf-8')
for key, value in json.loads(lyncser_json).items():
    with open(key, 'w') as f:
        f.write(value)
    os.chmod(key, 0o600)
