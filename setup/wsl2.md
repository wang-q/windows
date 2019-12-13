# Get iso

Windows 10 Enterprise VL Insider Preview - Build 18950 Chinese (Simplified)

# Active Windows 10 via KMS

<http://kms.nju.edu.cn/>

# Follow instructions of [this page](https://docs.microsoft.com/en-us/windows/wsl/wsl2-install)

Enable Virtualization in BIOS or VM

Mount Windows iso to D: 

Open PowerShell as an Administrator

```ps1
DISM /Online /Enable-Feature /FeatureName:NetFx3 /All /LimitAccess /Source:D:\sources\sxs
Enable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol -All

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform

```

Restart and set WSL 2 as default.

```ps1
wsl --set-default-version 2

```

# Ubuntu 18.04

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

# Install Windows Terminal

```ps1
Invoke-WebRequest 'https://github.com/microsoft/terminal/releases/download/v0.7.3382.0/Microsoft.WindowsTerminal_0.7.3382.0_8wekyb3d8bbwe.msixbundle' -OutFile 'Microsoft.WindowsTerminal.msixbundle'
Add-AppxPackage -path Microsoft.WindowsTerminal.msixbundle

```
