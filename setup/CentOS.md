# CentOS in WSL

https://learn.microsoft.com/en-us/windows/wsl/use-custom-distro

https://docs.docker.com/desktop/install/windows-install/

* Install Docker Desktop on Windows
    * Use WSL 2

docker pull centos:centos7

docker run -t centos:centos7 bash ls /

dockerContainerID=$(docker container ls -a | grep -i centos | awk '{print $1}')

docker export $dockerContainerID > /mnt/c/temp/centos.tar

cd C:\temp

wsl --import CentOS . .\centos.tar

wsl -l -v

wsl -d CentOS

<!-- wsl --unregister CentOS -->
