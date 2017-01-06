#!/usr/bin/env bash

export BASE_DIR=$HOME/Scripts/windows

if [[ $(uname) == 'Darwin' ]];
then
    if [ hash packer 2>/dev/null ];
    then
        echo "==> Install packer via brew"
        brew install packer
    else
        echo "==> Found packer in PATH"
    fi
fi

echo "==> Get needed softwares"
cd /prepare/resource

wget -N http://www.7-zip.org/a/7z920-x64.msi
wget -N http://downloads.sourceforge.net/project/ultradefrag/stable-release/6.1.0/ultradefrag-portable-6.1.0.bin.amd64.zip
wget -N http://download.sysinternals.com/files/SDelete.zip

echo "==> Build Windows box"
cd $BASE_DIR/packer

if [ ! -e $BASE_DIR/vm/windows_7_parallels.box ];
then
    packer build -only=parallels-iso windows_7.json
    mv windows_7_parallels.box $BASE_DIR/vm
fi

#if [ ! -e $BASE_DIR/vm/windows_7_virtualbox.box ];
#then
#    packer build -only=virtualbox-iso windows_7.json
#    mv windows_7_virtualbox.box $BASE_DIR/vm
#fi

# echo "==> Add base box"
# vagrant box add windows-7 $BASE_DIR/vm/windows_7_parallels.box --force
