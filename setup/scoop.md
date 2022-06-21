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
scoop bucket add extras

scoop install curl wget
scoop install gzip unzip grep
scoop install jq jid pandoc

scoop install bat ripgrep tokei hyperfine
scoop install sqlite sqlitestudio

# scoop install proxychains

```

* List installed packages

```powershell
scoop list

```
