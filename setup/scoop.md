# Get iso

Windows 10 Enterprise VL Insider Preview - Build 18950 Chinese (Simplified)

# Active Windows 10 via KMS

<http://kms.nju.edu.cn/>

# Install Scoop

Open a powershell window. All following commands pasted there.
Powershell is more like bash then cmd.

* Install `Scoop`

```ps1
set-executionpolicy remotesigned -s currentuser
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')

```

* Install global

```ps1
scoop install sudo
sudo Add-MpPreference -ExclusionPath $HOME\scoop
sudo Add-MpPreference -ExclusionPath 'C:\ProgramData\scoop'
sudo Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1
scoop install aria2 dark innounp

sudo scoop install -g 7zip git openssh

```

Close the powershell window and start a new one to refresh environment variables.

# Init Setup

```ps1
mkdir -p ~/Scripts
cd ~/Scripts
git clone --recursive https://github.com/wang-q/windows

cd ~/Scripts/windows/setup
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "Win10-Initial-Setup-Script/Win10.ps1" -include "Win10-Initial-Setup-Script/Win10.psm1" -preset "Default.preset"

```

# Install packages

Scoop can utilize aria2 to use multi-connection downloads.

```ps1
scoop install aria2 curl wget

scoop bucket add extras
scoop bucket add java

```

* Development packages

```ps1
sudo scoop install -g dotnet-sdk
sudo scoop install -g vcredist

sudo scoop install -g openjdk

scoop install miniconda3
conda install -n root -c pscondaenvs pscondaenvs

```

* GUI packages

```ps1
# sudo
sudo scoop install -g everything firefox

# utils
scoop install rufus windirstat

# development
scoop install beyondcompare github vscode winscp

# media
scoop install mpv-git
sudo ~\scoop\apps\mpv-git\current\installer\mpv-install.bat
scoop install handbrake

# others
scoop install notable slack

# Virtualization
scoop install packer vagrant

```

* Windows 7 games: https://winaero.com/download.php?view.1836

* List installed packages

```ps1
scoop list

```

# Ubuntu 18.04

Search `bash` in Microsoft Store or use the following command lines.

```ps1
Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1804 -OutFile Ubuntu.appx -UseBasicParsing
Add-AppxPackage .\Ubuntu.appx

```

# Install Windows Terminal

```ps1
Invoke-WebRequest 'https://github.com/microsoft/terminal/releases/download/v0.4.2382.0/Microsoft.WindowsTerminal_0.4.2382.0_8wekyb3d8bbwe.msixbundle' -OutFile 'Microsoft.WindowsTerminal.msixbundle'
Add-AppxPackage -path Microsoft.WindowsTerminal.msixbundle

```
