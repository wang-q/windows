# Scoop

## Install Scoop

* Install `Scoop`

```powershell
set-executionpolicy remotesigned -s currentuser
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')

scoop install sudo
sudo scoop install -g 7zip git openssh
[environment]::setenvironmentvariable('GIT_SSH', (resolve-path (scoop which ssh)), 'USER')

```

* Satisfy `scoop checkup`

```powershell
sudo Add-MpPreference -ExclusionPath $HOME\scoop
sudo Add-MpPreference -ExclusionPath 'C:\ProgramData\scoop'
sudo Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1
scoop install aria2 dark innounp

```

Scoop can utilize aria2 to use multi-connection downloads.

Close the powershell window and start a new one to refresh the environment variables.

## Install packages

```powershell
scoop install curl wget gzip grep

scoop bucket add extras

```

* Development packages

```powershell
sudo scoop install -g vcredist

scoop install ripgrep

```

* GUI packages

```powershell
# media
scoop install mpv-git
sudo ~\scoop\apps\mpv-git\current\installer\mpv-install.bat

# others
#scoop install notable

```

* List installed packages

```powershell
scoop list

```
