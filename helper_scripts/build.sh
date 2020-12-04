#!/bin/bash

if [ ! -d buildenv ]; then
  echo -e "=======\\nBuilding virtualenv\\n======="
  /usr/bin/python3 -m venv buildenv
  . ./buildenv/bin/activate
  echo -e "=======\\nInstalling virtualenv requirements======="
  sudo /usr/bin/pip3 install -r src/requirements.txt
  . ./buildenv/bin/deactivate
fi

if [ ! $(wich pyinstaller) ]; then
  echo -e "=======\\nInstalling pyinstaller\\n======="
  sudo /usr/bin/pip3 install pyinstaller
fi

echo -e "=======\\nBuilding Executable\\n======="
pyinstaller --paths buildenv/lib/python3.7/site-packages --onefile ./src/get_download_url.py --distpath ../ --workpath /tmp/ --noconfirm --clean
