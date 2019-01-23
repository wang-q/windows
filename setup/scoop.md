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
sudo scoop install 7zip git openssh --global
```

# Init Setup

```ps1
mkdir -p ~/Scripts
cd ~/Scripts
git clone --recursive https://github.com/wang-q/windows

cd ~/Scripts/windows/setup
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "Win10-Initial-Setup-Script/Win10.ps1" -include "Win10-Initial-Setup-Script/Win10.psm1" -preset "Default.preset"
```

TODO: SMB 1.0

# Install packages

Scoop can utilize aria2 to use multi-connection downloads.

```ps1
scoop install aria2 curl grep sed less touch

scoop bucket add extras
```

* Development packages

```ps1
scoop install dotnet-sdk
scoop install vcredist
```

* GUI packages

```ps1
# utils
scoop install conemu everything rufus windirstat

# development
scoop install beyondcompare github vscode

# media
scoop install mpv-git # run mpv-install
scoop install handbrake

scoop install firefox notable slack

```

* Windows 7 games: https://winaero.com/download.php?view.1836

* List installed packages

```ps1
scoop list
```
