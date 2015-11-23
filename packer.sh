#!/usr/bin/env bash

export BASE_DIR=$HOME/Scripts/egavm

echo "==> Install packer via brew cask"
brew cask install packer

echo "==> Get Windows iso"
cd $BASE_DIR/prepare/resource

# exported by [BaiduExporter](https://github.com/acgotaku/BaiduExporter)
aria2c -c -s10 -k1M -x10 -o "en_windows_7_enterprise_with_sp1_x64_dvd_u_677651.iso" \
    --header "User-Agent: netdisk;5.2.7;PC;PC-Windows;6.2.9200;WindowsBaiduYunGuanJia"  \
    --header "Cookie: BDUSS=2tHb1hiRHp0d0M2dDRZeEtGVHJVQ0FkUWUwMHlVMX5DTjM3YnV5RlBWNG5NfkJWQVFBQUFBJCQAAAAAAAAAAAEAAACclWRUb25lX21pbnVzAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACemyFUnpshVY;pcsett=1448294679-19f4b1e0a26d097de418f9a5cdc586d5"  \
    --header "Referer: http://pan.baidu.com/disk/home"  \
    "http://d.pcs.baidu.com/file/6467c3875955df4514395f0afcaaa62a?fid=2505102011-250528-446743520486458&time=1448208344&rt=pr&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-qx6tdxDTGMyzk1reqSRbLGJ96P4%3d&expires=8h&chkbd=0&chkv=0&dp-logid=7560952714652726727&dp-callid=0&r=933124655"

wget -N http://www.7-zip.org/a/7z920-x64.msi
wget -N http://downloads.sourceforge.net/project/ultradefrag/stable-release/6.1.0/ultradefrag-portable-6.1.0.bin.amd64.zip
wget -N http://download.sysinternals.com/files/SDelete.zip

echo "==> Build Windows box"
cd $BASE_DIR/packer-win

if [ ! -e $BASE_DIR/vm/windows_7_parallels.box ];
then
    packer build -only=parallels-iso windows_7.json
    mv windows_7_parallels.box $BASE_DIR/vm
fi

if [ ! -e $BASE_DIR/vm/windows_7_virtualbox.box ];
then
    packer build -only=virtualbox-iso windows_7.json
    mv windows_7_virtualbox.box $BASE_DIR/vm
fi

echo "==> Add base box"
vagrant box add windows_7 $BASE_DIR/vm/windows_7_parallels.box --force

# useful repos:
# * https://github.com/joefitzgerald/packer-windows
# * https://github.com/dylanmei/packer-windows-templates
# * https://github.com/boxcutter/windows
