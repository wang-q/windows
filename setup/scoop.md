# Install packages

```ps1
scoop install curl wget gzip

scoop bucket add extras
scoop bucket add java

```

* Development packages

```ps1
sudo scoop install -g dotnet-sdk
sudo scoop install -g vcredist

sudo scoop install -g openjdk
sudo scoop install -g cmake

sudo scoop install -g perl python

```

* GUI packages

```ps1
# sudo
sudo scoop install -g everything firefox

# development
scoop install beyondcompare github vscode winscp

# utils
scoop install rufus windirstat
scoop install bandizip quicklook

# media
scoop install mpv-git
sudo ~\scoop\apps\mpv-git\current\installer\mpv-install.bat
scoop install handbrake

# others
scoop install notable slack

```

* List installed packages

```ps1
scoop list

```
