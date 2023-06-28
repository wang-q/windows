# Scoop

## Install Scoop

* Install `Scoop`

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

# $ENV:ALL_PROXY='socks5h://localhost:10808'

irm get.scoop.sh | iex

scoop bucket add main
scoop bucket add extras

scoop install sudo 7zip
scoop install dark innounp

```

## Install packages

```powershell
# downloading tools
scoop install aria2 curl wget

scoop config aria2-enabled false

# gnu
scoop install gzip unzip grep
scoop install sed tar

scoop install jq jid pup
scoop install datamash miller

scoop install bat tealdeer
scoop install hyperfine ripgrep tokei
scoop install bottom

scoop install pandoc
scoop install sqlite

# extra
scoop install sqlitestudio

# scoop install proxychains

# List installed packages
scoop list

```
