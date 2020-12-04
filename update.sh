#!/bin/bash

output=$(./get_download_url)
exit_code=$?

if [ $exit_code == 0 ]; then
  read -r ver url <<<$output
  wget $url -O minecraft_server.jar.$ver

  if [ $(readlink minecraft_server.jar.prev) ]; then
    archive_ver=$(readlink minecraft_server.jar.prev)
    unlink minecraft_server.jar.prev
  if [ ! -d "archive" ]; then
    mkdir archive
  fi
  mv $archive_ver archive/.
  fi

  if [ $(readlink minecraft_server.jar) ]; then
    replace_ver=$(readlink minecraft_server.jar)
    unlink minecraft_server.jar
    ln -s $replace_ver minecraft_server.jar.prev
  fi

  ln -s minecraft_server.jar.$ver minecraft_server.jar
else
  echo $output
fi
