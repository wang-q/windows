# Steps

Open a powershell with admin

* Install choco

```ps1
Set-ExecutionPolicy bypass
iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
```

* Development packages

```ps1
choco install -y dotnet3.5
choco install -y vcredist2008 vcredist2010 vcredist2012 vcredist2013 vcredist2015
```

* CLI packages

```ps1
choco install -y curl wget
```

* GUI packages

```ps1
choco install -y 7zip.install
choco install -y atom
choco install -y firefox
choco install -y slack
choco install -y windirstat
choco install -y winscp.install  
```
