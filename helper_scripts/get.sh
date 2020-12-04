#!/bin/bash

os=$(uname -s)

if [ $os == "Darwin" ]; then
  os_ver="mac"
elif [ $os == "Linux" ]; then
  os_ver="linux"
else
  echo "Unsupported OS"
  exit
fi

echo -e "=======\\nDownloading MCSM resouces\\n======="

wget https://dizie.io/mcsm/builds/mcsm-$os_ver.tar.gz

echo -e "=======\\nExtracting MCSM resouces\\n======="

tar xzvf mcsm-$os_ver.tar.gz

cd mcsm