#!/bin/bash

distro=$(uname -s)

if [ $distro == "Darwin" ]; then
  rel_distro="mac"
elif [ $distro == "Linux" ]; then
  rel_distro="linux"
else
  echo "Operating System Not Supported"
  exit
fi

bash build_py_exe.sh

cd ../

work_path=$(pwd)

cd ../

sudo tar --exclude=".git*" --exclude="helper_scripts" --exclude="dist" --exclude=".idea" -czvf /tmp/mcsm-$rel_distro.tar.gz mcsm

cp /tmp/mcsm-$rel_distro.tar.gz $work_path/dist/.
