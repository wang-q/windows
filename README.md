# Setting-up scripts for Windows 10

[TOC levels=1-3]: # ""

- [Setting-up scripts for Windows 10](#setting-up-scripts-for-windows-10)
  - [Get ISO](#get-iso)
  - [Install, active and update Windows](#install-active-and-update-windows)
  - [Enable some optional features of Windows 10](#enable-some-optional-features-of-windows-10)
  - [WSL 2](#wsl-2)
  - [Ubuntu 20.04](#ubuntu-2004)
  - [Install `winget` and `Windows Terminal`](#install-winget-and-windows-terminal)
  - [Optional: Adjusting Windows](#optional-adjusting-windows)
  - [Optional: winget-pkgs](#optional-winget-pkgs)
  - [Optional: Windows 7 games](#optional-windows-7-games)
  - [Optional: Packages Managements](#optional-packages-managements)
  - [Optional: Rust and C/C++](#optional-rust-and-cc)
  - [Directory Organization](#directory-organization)


Most following commands should be pasted to `Powershell`.

## Get ISO

Some features of Windows 10 20H1/2004 are needed here.

* Build 19041.84 or later
* English or Chinese Simplified
* 64-bit

So download [Windows 10 Enterprise VL Insider
Preview](https://docs.microsoft.com/en-us/windows-insider/flight-hub/) or use the following
link:

* <ed2k://|file|cn_windows_10_business_editions_version_20h2_updated_feb_2021_x64_dvd_be28e70d.iso|6060609536|6EE4C60193418417843D7A2F4518C9D7|/>
* <magnet:?xt=urn:btih:D4088008828F2B7D95B3546D32C641B736001AF5&dn=cn_windows_10_business_editions_version_20h2_updated_feb_2021_x64_dvd_be28e70d.iso&xl=6060609536>

## Install, active and update Windows

* Enable Virtualization in BIOS or VM

* Active Windows 10 via KMS, <http://kms.nju.edu.cn/>

* Update Windows and then check system info

```powershell
# simple
winver

# details
systeminfo

```

After Windows updating, the Windows version is 19042.804 as my current date.

## Enable some optional features of Windows 10

* Mount Windows ISO to D: (or others)

* Open PowerShell as an Administrator

```powershell
# .Net 2.5 and 3
DISM /Online /Enable-Feature /FeatureName:NetFx3 /All /LimitAccess /Source:D:\sources\sxs

# SMB 1
Enable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol -All

```

## WSL 2

* Follow instructions of [this page](https://docs.microsoft.com/en-us/windows/wsl/wsl2-install)

* Open PowerShell as an Administrator

```powershell
# WSL
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

# HyperV
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform

```

Update the [WSL 2](https://docs.microsoft.com/en-us/windows/wsl/wsl2-kernel) Linux kernel if
necessarily.

Restart then set WSL 2 as default.

```powershell
wsl --set-default-version 2

```

## Ubuntu 20.04

Search `bash` in Microsoft Store or use the following command lines.

```powershell
if (!(Test-Path Ubuntu.appx -PathType Leaf)) {
    Invoke-WebRequest -Uri https://aka.ms/wslubuntu2004 -OutFile Ubuntu.appx -UseBasicParsing
}
Add-AppxPackage .\Ubuntu.appx

```

Launch the distro from the Start menu, wait for a minute or two for the installation to complete,
and set up a new Linux user account.

The following command verifies the status of WSL:

```powershell
wsl -l -v

```

## Install `winget` and `Windows Terminal`

```powershell
if (!(Test-Path Microsoft.WindowsTerminal.msixbundle -PathType Leaf)) {
    Invoke-WebRequest 'https://github.com/microsoft/winget-cli/releases/download/v-0.2.10191-preview/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.appxbundle' -OutFile 'Microsoft.DesktopAppInstaller.appxbundle'
}
Add-AppxPackage -path .\Microsoft.DesktopAppInstaller.appxbundle

winget install -e --id Microsoft.WindowsTerminal

winget install -e --id Git.Git

```

## Optional: Adjusting Windows

```powershell
mkdir -p ~/Scripts
cd ~/Scripts
git clone --recursive https://github.com/wang-q/windows

cd ~/Scripts/windows/setup
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "Win10-Initial-Setup-Script/Win10.ps1" -include "Win10-Initial-Setup-Script/Win10.psm1" -preset "Default.preset"

```

Get updates from Microsoft Store.

## Optional: winget-pkgs

```powershell
# programming
winget install -e --id AdoptOpenJDK.OpenJDK
winget install -e --id Microsoft.dotnet
winget install -e --id StrawberryPerl.StrawberryPerl
winget install -e --id Python.Python
winget install -e --id RProject.R
winget install -e --id RStudio.RStudio
winget install -e --id Kitware.CMake

# development
winget install -e --id GitHub.GitHubDesktop
winget install -e --id WinSCP.WinSCP
winget install -e --id Microsoft.VisualStudioCode
winget install -e --id ScooterSoftware.BeyondCompare4
winget install -e --id JetBrains.Toolbox

# utils
winget install -e --id voidtools.Everything
winget install -e --id Bandisoft.Bandizip
winget install -e --id Rufus.Rufus
winget install -e --id QL-Win.QuickLook
winget install -e --id AntibodySoftware.WizTree
winget install -e --id thehandbraketeam.handbrake
winget install -e --id Microsoft.PowerToys
winget install -e --id qBittorrent.qBittorrent

# apps
winget install -e --id Mozilla.Firefox
winget install -e --id Tencent.WeChat
winget install -e --id Tencent.TencentMeeting
winget install -e --id Tencent.QQ
winget install -e --id Netease.CloudMusic
winget install -e --id Youdao.YoudaoDict
# winget install -e --id Adobe.AdobeAcrobatReaderDC

```

## Optional: Windows 7 games

<https://winaero.com/download.php?view.1836>

## Optional: Packages Managements

* [`scoop.md`](setup/scoop.md)
* [`msys2.md`](setup/msys2.md)

## Optional: Rust and C/C++

* [`rust.md`](setup/rust.md)

## Directory Organization

* [`packer/`](packer/): Scripts for building a Windows 10 box for Parallels.

* [`setup/`](setup/): Scripts for setting-up Windows.

