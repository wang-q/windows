# Steps

Open a powershell with admin

* Install choco

```ps1
Set-ExecutionPolicy bypass
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

* Install comemu first for better terminal experience

```cmd
choco install -y conemu
```

* Development packages

```cmd
choco install -y git
choco install -y dotnet3.5
choco install -y vcredist2008 vcredist2010 vcredist2012 vcredist2013 vcredist2015 vcredist140
choco install -y cmake jq openssh
```

* Running scripts

```cmd
cd /d %UserProfile%
mkdir Scripts
cd Scripts
git clone https://github.com/wang-q/windows
powershell -executionpolicy bypass -File windows\setup\desktop_icons.ps1
powershell -executionpolicy bypass -File windows\setup\win10_setup.ps1
```

* [Destroy Windows Spying](https://renessans.bz/)

* Programming languages

```cmd
choco install -y jdk8
choco install -y python
choco install -y r.project
```

* CLI packages

```cmd
choco install -y 7zip.commandline
choco install -y curl wget aria2 vim
```

* GUI packages

```cmd
choco install -y 7zip.install Everything rufus
choco install -y adobereader firefox mpv netease-cloudmusic slack
choco install -y putty.portable vscode windirstat winscp.install  
```

* List installed packages

```cmd
choco list --local-only
```
