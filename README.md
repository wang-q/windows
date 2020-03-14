# Setting-up scripts for Windows 10

[TOC levels=1-3]: # ""

- [Setting-up scripts for Windows 10](#setting-up-scripts-for-windows-10)
  - [Get ISO](#get-iso)
  - [Active Windows 10 via KMS](#active-windows-10-via-kms)
  - [System Info](#system-info)
  - [Enable some optional features of Windows 10](#enable-some-optional-features-of-windows-10)
  - [WSL 2](#wsl-2)
  - [Ubuntu 18.04](#ubuntu-1804)
  - [Install Windows Terminal](#install-windows-terminal)
  - [Install Scoop](#install-scoop)
  - [Optional: OpenSSH Server](#optional-openssh-server)
  - [Optional: Adjusting Windows](#optional-adjusting-windows)
  - [Optional: Windows 7 games](#optional-windows-7-games)
  - [Optional: Packages Managements](#optional-packages-managements)
  - [Directory Organization](#directory-organization)


All following commands should be pasted to `Powershell`, which is more like `bash` then `cmd`.

## Get ISO

Some features of Windows 10 (20H1) are needed here, so download [Windows 10 Enterprise VL Insider
Preview](https://docs.microsoft.com/en-us/windows-insider/flight-hub/) first:

* Build 19041
* English or Chinese Simplified
* 64-bit

## Active Windows 10 via KMS

<http://kms.nju.edu.cn/>

## System Info

```cmd
# simple
winver

# details
systeminfo

```

## Enable some optional features of Windows 10

* Mount Windows ISO to D: (or others)

* Open PowerShell as an Administrator

```ps1
# .Net 2.5 and 3
DISM /Online /Enable-Feature /FeatureName:NetFx3 /All /LimitAccess /Source:D:\sources\sxs

# SMB 1
Enable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol -All

```

## WSL 2

* Enable Virtualization in BIOS or VM

* Follow instructions of [this page](https://docs.microsoft.com/en-us/windows/wsl/wsl2-install)

* Open PowerShell as an Administrator

```ps1
# WSL
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

# HyperV
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform

```

Restart, then set WSL 2 as default.

```ps1
wsl --set-default-version 2

```

## Ubuntu 18.04

Search `bash` in Microsoft Store or use the following command lines.

```ps1
if (!(Test-Path Ubuntu.appx -PathType Leaf)) {
    Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1804 -OutFile Ubuntu.appx -UseBasicParsing
}
Add-AppxPackage .\Ubuntu.appx

```

Launch the distro from the Start menu, wait for a minute or two for the installation to complete,
and set up a new Linux user account.

The following command verifies the status of WSL:

```ps1
wsl -l -v

```

## Install Windows Terminal

```ps1
if (!(Test-Path Microsoft.WindowsTerminal.msixbundle -PathType Leaf)) {
    Invoke-WebRequest 'https://github.com/microsoft/terminal/releases/download/v0.9.433.0/Microsoft.WindowsTerminal_0.9.433.0_8wekyb3d8bbwe.msixbundle' -OutFile 'Microsoft.WindowsTerminal.msixbundle'
}
Add-AppxPackage -path Microsoft.WindowsTerminal.msixbundle

```

## Install Scoop

* Install `Scoop`

```ps1
set-executionpolicy remotesigned -s currentuser
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')

scoop install sudo
sudo scoop install -g 7zip git openssh
[environment]::setenvironmentvariable('GIT_SSH', (resolve-path (scoop which ssh)), 'USER')

```

* Satisfy `scoop checkup`

```ps1
sudo Add-MpPreference -ExclusionPath $HOME\scoop
sudo Add-MpPreference -ExclusionPath 'C:\ProgramData\scoop'
sudo Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1
scoop install aria2 dark innounp

```

Scoop can utilize aria2 to use multi-connection downloads.

Close the powershell window and start a new one to refresh environment variables.

## Optional: OpenSSH Server

Microsoft ported OpenSSH to Windows after
[the 1809 release](https://docs.microsoft.com/zh-cn/windows-server/administration/openssh/openssh_install_firstuse),
but I got some errors while trying this approach.

So use the old way.

* [Ref 1](https://github.com/PowerShell/Win32-OpenSSH/wiki/Install-Win32-OpenSSH)
* [Ref 2](http://chrisarges.net/2019/07/16/openssh-install-on-windows.html)

```ps1
if (!(Test-Path OpenSSH-Win64.zip -PathType Leaf)) {
    Invoke-WebRequest 'https://github.com/PowerShell/Win32-OpenSSH/releases/download/v8.1.0.0p1-Beta/OpenSSH-Win64.zip' -OutFile 'OpenSSH-Win64.zip'
}
sudo Expand-Archive -Path OpenSSH-Win64.zip -DestinationPath 'C:\Program Files\'

cd 'C:\Program Files\OpenSSH-Win64\'
sudo .\install-sshd.ps1

# Firewall
sudo netsh advfirewall firewall add rule name=sshd dir=in action=allow protocol=TCP localport=22

# Start Service
sudo net start sshd
sudo Set-Service sshd -StartupType Automatic

```

There is a bug when transfer [large files](https://github.com/PowerShell/Win32-OpenSSH/issues/1395)
via sftp to Windows, be careful.

## Optional: Adjusting Windows

```ps1
mkdir -p ~/Scripts
cd ~/Scripts
git clone --recursive https://github.com/wang-q/windows

cd ~/Scripts/windows/setup
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "Win10-Initial-Setup-Script/Win10.ps1" -include "Win10-Initial-Setup-Script/Win10.psm1" -preset "Default.preset"

```

## Optional: Windows 7 games

<https://winaero.com/download.php?view.1836>

## Optional: Packages Managements

* [`scoop.md`](setup/scoop.md)
* [`msys2.md`](setup/msys2.md)

## Directory Organization

* [`packer/`](packer/): Scirpts for building a Windows 10 box for Parallels.

* [`setup/`](setup/): Scirpts for setting-up Windows.

