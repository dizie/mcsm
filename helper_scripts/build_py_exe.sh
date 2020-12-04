#!/bin/bash

if [ ! -d "_buildenv" ]; then
  echo -e "=======\\nBuilding virtualenv\\n======="
  /usr/bin/python3 -m venv _buildenv
  . ./_buildenv/bin/activate
  echo -e "=======\\nInstalling virtualenv requirements======="
  sudo /usr/bin/pip3 install -r src/requirements.txt
  . ./_buildenv/bin/deactivate
fi

if [ ! $(which pyinstaller) ]; then
  echo -e "=======\\nInstalling pyinstaller\\n======="
  sudo /usr/bin/pip3 install pyinstaller
fi

echo -e "=======\\nBuilding Executable\\n======="
pyinstaller --paths buildenv/lib/python3.7/site-packages --onefile ./src/get_download_url.py --distpath ../ --workpath /tmp/ --noconfirm --clean
