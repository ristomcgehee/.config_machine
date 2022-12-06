
# Download latest release from github

import os
import requests
import sys
import tarfile

# Get the repo owner and name from CLI arguments
repo_owner = sys.argv[1]
repo_name = sys.argv[2]

latest_release = requests.get(f'https://api.github.com/repos/{repo_owner}/{repo_name}/releases/latest').json()
# Find the latest Linux amd64 release
for asset in latest_release['assets']:
    if asset['name'].endswith('amd64.tar.gz'):
        download_url = asset['browser_download_url']
        break

# Download the release
r = requests.get(download_url, allow_redirects=True)
tarfile = f'{repo_name}.tar.gz'
open(tarfile, 'wb').write(r.content)
tar = tarfile.open(tarfile, 'r:gz')
tar.extractall()
tar.close()
os.remove(tarfile)
