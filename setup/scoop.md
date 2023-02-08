# Scoop

## Install Scoop

* Install `Scoop`

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

# $ENV:ALL_PROXY='socks5h://localhost:10808'

irm get.scoop.sh | iex

scoop install sudo 7zip

scoop install dark innounp

```

## Install packages

```powershell
scoop install aria2 curl wget
scoop install gzip unzip grep
scoop install jq jid pandoc

scoop install bat ripgrep tokei hyperfine
scoop install sqlite

scoop bucket add extras
scoop install sqlitestudio

# scoop install proxychains

```

* List installed packages

```powershell
scoop list

```
