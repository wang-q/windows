# Setting-up scripts for Windows 10

[TOC levels=1-3]: # ""

- [Setting-up scripts for Windows 10](#setting-up-scripts-for-windows-10)
  - [Get ISO](#get-iso)
  - [Active Windows 10 via KMS](#active-windows-10-via-kms)
  - [Update Windows](#update-windows)
  - [Enable some optional features of Windows 10](#enable-some-optional-features-of-windows-10)
  - [WSL 2](#wsl-2)
  - [Ubuntu 18.04](#ubuntu-1804)
  - [Install Windows Terminal](#install-windows-terminal)
  - [Install Scoop](#install-scoop)
  - [Optional: OpenSSH Server](#optional-openssh-server)
  - [Optional: Adjusting Windows](#optional-adjusting-windows)
  - [Optional: Windows 7 games](#optional-windows-7-games)
  - [Optional: Packages Managements](#optional-packages-managements)
  - [Optional: Rust and C/C++](#optional-rust-and-cc)
  - [Directory Organization](#directory-organization)


All following commands should be pasted to `Powershell`, which is more like `bash` then `cmd`.

## Get ISO

Some features of Windows 10 (20H1) are needed here, so download [Windows 10 Enterprise VL Insider
Preview](https://docs.microsoft.com/en-us/windows-insider/flight-hub/) first:

* Build 19041.84
* English or Chinese Simplified
* 64-bit

## Active Windows 10 via KMS

<http://kms.nju.edu.cn/>

## Update Windows

Update Windows and then check system info

```cmd
# simple
winver

# details
systeminfo

```

After Windows updating, Windows version is 19041.153 as my current date.

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

Updating the [WSL 2](https://docs.microsoft.com/en-us/windows/wsl/wsl2-kernel) Linux kernel if
necessarily.


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

Search `Windows Terminal` in Microsoft Store or use the following command lines.

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

## Optional: Adjusting Windows

```ps1
mkdir -p ~/Scripts
cd ~/Scripts
git clone --recursive https://github.com/wang-q/windows

cd ~/Scripts/windows/setup
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "Win10-Initial-Setup-Script/Win10.ps1" -include "Win10-Initial-Setup-Script/Win10.psm1" -preset "Default.preset"

```

Get updates from Microsoft Store.

## Optional: Windows 7 games

<https://winaero.com/download.php?view.1836>

## Optional: Packages Managements

* [`scoop.md`](setup/scoop.md)
* [`msys2.md`](setup/msys2.md)

## Optional: Rust and C/C++

* [`rust.md`](setup/rust.md)

## Directory Organization

* [`packer/`](packer/): Scirpts for building a Windows 10 box for Parallels.

* [`setup/`](setup/): Scirpts for setting-up Windows.

