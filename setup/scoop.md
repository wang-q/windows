# Scoop

## Install Scoop

* Install `Scoop`

```powershell
set-executionpolicy remotesigned -s currentuser
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')

scoop install sudo 7zip

scoop install aria2 dark innounp

```

Scoop can utilize aria2 to use multi-connection downloads.

Close the powershell window and start a new one to refresh the environment variables.

## Install packages

```powershell
scoop install curl wget gzip grep
scoop install jq

scoop bucket add extras

scoop install ripgrep

```

* List installed packages

```powershell
scoop list

```
