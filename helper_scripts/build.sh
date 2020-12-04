#!/bin/bash

if [ ! -d buildenv ]; then
  /usr/bin/python3 -m venv buildenv
  . ./buildenv/bin/activate
  sudo /usr/bin/pip3 install -r src/requirements.txt
  . ./buildenv/bin/deactivate
fi

pyinstaller --paths buildenv/lib/python3.7/site-packages --onefile ./src/get_download_url.py --distpath ../ --workpath /tmp/ --noconfirm --clean
