#!/bin/bash

. ./venv/bin/activate
output=$(python get_download_url.py)
exit_code=$?

if [ $exit_code == 0 ]; then
  read -r ver url <<<$output
  wget $url -O minecraft_server.jar.$ver
  ln -s minecraft_server.jar.$ver minecraft_server.jar
  /bin/bash run.sh
else
  echo $output
fi
