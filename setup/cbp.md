# cbp

## Install cbp

```powershell
$ENV:ALL_PROXY='socks5h://localhost:7890'

iwr "https://github.com/wang-q/cbp/releases/latest/download/cbp.windows.exe" -OutFile cbp.windows.exe
.\cbp.windows.exe init

# Restart terminal

```

## Install packages

```powershell
cbp install jq

cbp install fd
cbp install hyperfine
cbp install ripgrep
cbp install tealdeer
cbp install tokei

cbp install pandoc

```
