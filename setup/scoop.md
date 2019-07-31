# Active Windows 10 via KMS

http://kms.nju.edu.cn/

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
sudo scoop install -g 7zip git openssh

```

# Init Setup

Close then reopen the powershell window to refresh %PATH%

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
scoop install aria2 curl

scoop bucket add extras
scoop bucket add java

```

* Development packages

```ps1
sudo scoop install -g dotnet-sdk
sudo scoop install -g vcredist

sudo scoop install -g openjdk9

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
scoop install beyondcompare github vscode

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
