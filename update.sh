#!/bin/bash

. ./venv/bin/activate
output=$(python get_download_url.py)
exit_code=$?

if [ $exit_code == 0 ]; then
  read -r ver url <<<$output
  wget $url -O minecraft_server.jar.$ver
  replace_ver=$(readlink minecraft_server.jar)
  archive_ver=$(readlink minecraft_server.jar.prev)
  unlink minecraft_server.jar
  unlink minecraft_server.jar.prev
  if [ ! -d "archive" ]; then
    mkdir archive
  fi
  mv $archive_ver archive/.
  ln -s minecraft_server.jar.$ver minecraft_server.jar
  ln -s $replace_ver minecraft_server.jar.prev
else
  echo $output
fi
