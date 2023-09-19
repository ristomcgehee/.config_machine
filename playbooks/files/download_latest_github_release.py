#!/usr/bin/env python3
# Download latest release from github

import os
import requests
import sys
import tarfile
import tempfile

# Get the repo owner and name from CLI arguments
repo_owner = sys.argv[1]
repo_name = sys.argv[2]

# tempdir = tempfile.mkdtemp()
# os.chdir(tempdir)

latest_release = requests.get(f'https://api.github.com/repos/{repo_owner}/{repo_name}/releases/latest').json()
# Find the latest Linux amd64 release
for asset in latest_release['assets']:
    if asset['name'].endswith('linux_amd64.tar.gz'):
        download_url = asset['browser_download_url']
        break

# Download the release
r = requests.get(download_url, allow_redirects=True)
tarball = f'{repo_name}.tar.gz'
open(tarball, 'wb').write(r.content)
tar = tarfile.open(tarball, 'r:gz')
tar.extractall()
tar.close()
os.remove(tarball)
