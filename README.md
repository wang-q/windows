# Setting-up scripts for Windows 10

## Get ISO

Some features of Windows 10 (20H1) are needed here, so download [Windows 10 Enterprise VL Insider
Preview](https://docs.microsoft.com/en-us/windows-insider/flight-hub/) first:

    * Build 19035
    * English or Chinese Simplified
    * 64-bit

## Active Windows 10 via KMS

<http://kms.nju.edu.cn/>

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
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform

```

Restart, then set WSL 2 as default.

```ps1
wsl --set-default-version 2

```

## Ubuntu 18.04

Search `bash` in Microsoft Store or use the following command lines.

```ps1
Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1804 -OutFile Ubuntu.appx -UseBasicParsing
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
Invoke-WebRequest 'https://github.com/microsoft/terminal/releases/download/v0.7.3451.0/Microsoft.WindowsTerminal_0.7.3451.0_8wekyb3d8bbwe.msixbundle' -OutFile 'Microsoft.WindowsTerminal.msixbundle'
Add-AppxPackage -path Microsoft.WindowsTerminal.msixbundle

```

## Directory Organization

* [`packer/`](packer/): Scirpts for building a Windows 7 box for Parallels.

* [`setup/`](setup/): Scirpts for setting-up Windows.
