# Setting-up scripts for Windows 11

<!-- toc -->

- [Get ISO](#get-iso)
- [Install, active and update Windows](#install-active-and-update-windows)
- [Enable some optional features of Windows](#enable-some-optional-features-of-windows)
- [WSL 2](#wsl-2)
- [Ubuntu 20.04](#ubuntu-2004)
  * [`systemd`](#systemd)
  * [Symlinks](#symlinks)
- [`winget` and `Windows Terminal`](#winget-and-windows-terminal)
- [Optional: Adjusting Windows](#optional-adjusting-windows)
- [Optional: winget-pkgs](#optional-winget-pkgs)
- [Optional: Packages Managements](#optional-packages-managements)
- [Optional: Rust and C/C++](#optional-rust-and-cc)
- [Optional: sysinternals](#optional-sysinternals)
- [Optional: QuickLook Plugins](#optional-quicklook-plugins)
- [Optional: Windows 7 games](#optional-windows-7-games)
- [Directory Organization](#directory-organization)

<!-- tocstop -->

Most following commands should be pasted to `Powershell`.

## Get ISO

Windows 11

* Build 22000 or later
* English or Chinese Simplified
* 64-bit

* `winget` and `Windows Terminal` are now built-in

* Windows 11
    * <magnet:?xt=urn:btih:01f5fe67f19cf107330490f658836c6037054f65&dn=zh-cn_windows_11_business_editions_version_22h2_updated_jan_2023_x64_dvd_82450200.iso&xl=5628721152>

## Install, active and update Windows

* Enable Virtualization in BIOS or VM

* Active Windows via KMS, <http://kms.nju.edu.cn/>

* Update Windows and then check system info

```powershell
# simple
winver

# details
systeminfo

```

After Windows updating, the Windows version is 22621.1265 as my current date.

## Enable some optional features of Windows

* Mount Windows ISO to D: (or others)

* Open PowerShell as an Administrator

```powershell
# .Net 2.5 and 3
DISM /Online /Enable-Feature /FeatureName:NetFx3 /All /LimitAccess /Source:D:\sources\sxs /NoRestart

# Online
# DISM /Online /Enable-Feature /FeatureName:NetFx3 /All /NoRestart

# SMB 1
Enable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol -All -NoRestart

# Telnet
DISM /Online /Enable-Feature /FeatureName:TelnetClient /NoRestart

```

## WSL 2

* Follow instructions of [this page](https://docs.microsoft.com/en-us/windows/wsl/wsl2-install)

* Open an elevated PowerShell

```powershell
# HyperV
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All -NoRestart

# # WSL
# Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart

```

Install the GA version of [WSL](https://www.microsoft.com/store/productId/9P9TQF7MRM4R) from the
Windows store.

Restart then set WSL 2 as default.

```powershell
wsl --set-default-version 2

```

## Ubuntu 20.04

Search `bash` in Microsoft Store or use the following command lines.

```powershell
if (!(Test-Path Ubuntu.appx -PathType Leaf))
{
    Invoke-WebRequest -Uri https://aka.ms/wslubuntu2004 -OutFile Ubuntu2004.appx -UseBasicParsing
}
Add-AppxPackage .\Ubuntu2004.appx

```

Launch the distro from the Start menu, wait for a minute or two for the installation to complete,
and set up a new Linux user account.

The following command verifies the status of WSL:

```powershell
wsl -l -v

```

### `systemd`

https://devblogs.microsoft.com/commandline/systemd-support-is-now-available-in-wsl/

### Symlinks

* WSL: reduce the space occupied by virtual disks

```shell
cd

rm -fr Script data

ln -s /mnt/c/Users/wangq/Scripts/ ~/Scripts

ln -s /mnt/d/data/ ~/data

```

* Windows: second disk
    * Open `cmd.exe` as an Administrator

```cmd
cd c:\Users\wangq\

mklink /D c:\Users\wangq\data d:\data

```

## `winget` and `Windows Terminal`

`winget` and `Windows Terminal` are now included by Windows 11

```powershell
winget install -s winget -e --id Git.Git

```

Open `Windows Terminal`

* Set `Default terminal application` to `Windows Terminal`.

* Set `Interaction` -> `Remove trailing white-space when pasting` to Off

* Hide unneeded `Profiles`.

## Optional: Adjusting Windows

Works with Windows 10 or 11.

```powershell
mkdir -p ~/Scripts
cd ~/Scripts
git clone --recursive https://github.com/wang-q/windows

cd ~/Scripts/windows/setup
powershell.exe -NoProfile -ExecutionPolicy Bypass `
    -File "Win10-Initial-Setup-Script/Win10.ps1" `
    -include "Win10-Initial-Setup-Script/Win10.psm1" `
    -preset "Default.preset"

```

Log in to the Microsoft Store and get updates from there.

* Remove "Home" (主文件夹) from Explorer in Windows 11

```cmd
reg add "HKCU\Software\Classes\CLSID\{f874310e-b6b7-47dc-bc84-b9e6b38f5903}" /v System.IsPinnedToNameSpaceTree /d 0 /t REG_DWORD /f

# manually accessing that view is still possible
explorer.exe shell:::{f874310e-b6b7-47dc-bc84-b9e6b38f5903}

```

## Optional: winget-pkgs

```powershell
# programming
winget install -s winget -e --id Oracle.JavaRuntimeEnvironment
winget install -s winget -e --id Oracle.JDK.18
winget install -s winget -e --id StrawberryPerl.StrawberryPerl
# winget install -e --id Python.Python
winget install -s winget -e --id RProject.R
# winget install -s winget -e --id RProject.Rtools
# winget install -s winget -e --id OpenJS.NodeJS.LTS
winget install -s winget -e --id RStudio.RStudio.OpenSource
winget install -s winget -e --id Kitware.CMake
winget install -s winget -e --id Microsoft.PowerShell

# development
winget install -s winget -e --id GitHub.GitHubDesktop
winget install -s winget -e --id GitHub.cli
winget install -s winget -e --id WinSCP.WinSCP
winget install -s msstore --accept-package-agreements "Visual Studio Code"
winget install -s winget -e --id ScooterSoftware.BeyondCompare4
winget install -s winget -e --id JetBrains.Toolbox
winget install -s winget -e --id RealVNC.VNCViewer

# winget install -e --id WinFsp.WinFsp
# winget install -e --id SSHFS-Win.SSHFS-Win
# \\sshfs\REMUSER@HOST[\PATH]

# winget install -e --id Docker.DockerDesktop
# winget install -e --id VMware.WorkstationPlayer
# winget install -s winget -e --id Canonical.Multipass

# utils
winget install -s winget -e --id voidtools.Everything
winget install -s msstore --accept-package-agreements Bandizip
winget install -s msstore --accept-package-agreements Rufus # need v3.18 or higher
winget install -s msstore --accept-package-agreements QuickLook
winget install -s winget -e --id AntibodySoftware.WizTree
winget install -s msstore --accept-package-agreements "Microsoft PowerToys"
winget install -s winget -e --id qBittorrent.qBittorrent
winget install -s winget -e --id OlegDanilov.RapidEnvironmentEditor
# winget install -s winget -e --id Fndroid.ClashForWindows

# media
winget install -s winget -e --id NetEase.CloudMusic
winget install -s winget -e --id HandBrake.HandBrake
winget install -s msstore --accept-package-agreements mpv.net
winget install -s msstore --accept-package-agreements "iQIYI Windows client app"
# winget install -s winget -e --id IrfanSkiljan.IrfanView

# apps
# winget install -s winget -e --id Mozilla.Firefox
winget install -s winget -e --id Tencent.WeChat
winget install -s winget -e --id Tencent.TencentMeeting
winget install -s winget -e --id Tencent.QQ
winget install -s winget -e --id Alibaba.DingTalk
winget install -s winget -e --id ByteDance.Feishu
winget install -s winget -e --id Youdao.YoudaoDict
winget install -s winget -e --id Baidu.BaiduNetdisk
winget install -s winget -e --id DigitalScholar.Zotero
winget install -s msstore --accept-package-agreements "Microsoft Whiteboard"
winget install -s msstore --accept-package-agreements "Adobe Acrobat Reader DC"

```

## Optional: Packages Managements

[scoop.md](setup/scoop.md):

> Scoop is an installer.
>
> The goal of Scoop is to let you use Unix-y programs in a normal Windows environment.
>
> Scoop focuses on open-source, command-line developer tools.

Other options include `Chocolatey` and `msys2`, but I don't really like either of them.

## Optional: Rust and C/C++

* [rust.md](setup/rust.md)

## Optional: sysinternals

* Add `$HOME/bin` to Path
* Open PowerShell as an Administrator

```powershell
mkdir $HOME/bin

# Add to Path
[Environment]::SetEnvironmentVariable(
    "Path",
    [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine) + ";$HOME\bin",
    [EnvironmentVariableTarget]::Machine)

```

* Download and extract

```powershell
scoop install aria2 unzip

$array = "DU", "ProcessExplorer", "ProcessMonitor", "RAMMap"

foreach ($app in $array)
{
    iwr "https://download.sysinternals.com/files/$app.zip" -O "$app.zip"
}

foreach ($app in $array)
{
    unzip "$app.zip" -d $HOME/bin -x Eula.txt
}

rm $HOME/bin/*.chm
rm $HOME/bin/*64.exe
rm $HOME/bin/*64a.exe

```

## Optional: QuickLook Plugins

<https://github.com/QL-Win/QuickLook/wiki/Available-Plugins>

```powershell
# epub
$url = (
iwr https://api.github.com/repos/QL-Win/QuickLook.Plugin.EpubViewer/releases/latest |
    Select-Object -Expand Content |
    jq -r '.assets[0].browser_download_url'
)
curl.exe -LO $url

# office
$url = (
iwr https://api.github.com/repos/QL-Win/QuickLook.Plugin.OfficeViewer/releases/latest |
    Select-Object -Expand Content |
    jq -r '.assets[0].browser_download_url'
)
curl.exe -LO $url

# folder
$url = (
iwr https://api.github.com/repos/adyanth/QuickLook.Plugin.FolderViewer/releases/latest |
    Select-Object -Expand Content |
    jq -r '.assets[0].browser_download_url'
)
curl.exe -LO $url

```

Select the `qlplugin` file and press `Spacebar` to install the plugin.

## Optional: Windows 7 games

<https://winaero.com/download.php?view.1836>

## Directory Organization

* [`packer/`](packer/): Scripts for building a Windows 10 box for Parallels.

* [`setup/`](setup/): Scripts for setting-up Windows.
