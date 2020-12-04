#!/bin/bash

output=$(./get_download_url)
exit_code=$?

if [ $exit_code == 0 ]; then
  read -r ver url <<<$output
  wget $url -O minecraft_server.jar.$ver
  ln -s minecraft_server.jar.$ver minecraft_server.jar
  if [ ! -f "eula.txt" ]; then
    /bin/bash run.sh
  fi
else
  echo $output
fi
