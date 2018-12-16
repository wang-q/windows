# Steps

Open a powershell window

* Install `Scoop`

    .Net 4.0 will be downloaded under Windows 7

```ps1
set-executionpolicy remotesigned -s currentuser
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
```

* Install global

```cmd
scoop install sudo
sudo scoop install 7zip git openssh --global
```

* Open a new cmd window

    Scoop can utilize aria2 to use multi-connection downloads.

```cmd
scoop install aria2 curl grep sed less touch

scoop bucket add extras
```

* Development packages

```cmd
scoop install dotnet-sdk
scoop install vcredist
```

* GUI packages

```cmd
scoop install conemu everything rufus
scoop install mpv-git # run mpv-install
scoop install steam beyondcompare
```

* WSL

```bat
# WSL
aria2c -x 6 -s 3 -c https://lxrunoffline.apphb.com/download/UbuntuFromMS/14

Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1604 -OutFile Ubuntu.appx -UseBasicParsing

# Windows 7 games: https://winaero.com/download.php?view.1836
```

* List installed packages

```cmd
scoop list
```
