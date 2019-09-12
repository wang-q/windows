# Install Scoop

Open a powershell window. All following commands pasted there.
`Powershell` is more like `bash` then `cmd`.

* Install `Scoop`

```ps1
set-executionpolicy remotesigned -s currentuser
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')

```

* Satisfy `scoop checkup`

```ps1
scoop install sudo
sudo Add-MpPreference -ExclusionPath $HOME\scoop
sudo Add-MpPreference -ExclusionPath 'C:\ProgramData\scoop'
sudo Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1
scoop install aria2 dark innounp

sudo scoop install -g 7zip git openssh
[environment]::setenvironmentvariable('GIT_SSH', (resolve-path (scoop which ssh)), 'USER')

```

Scoop can utilize aria2 to use multi-connection downloads.

Close the powershell window and start a new one to refresh environment variables.

# Adjusting Windows

```ps1
mkdir -p ~/Scripts
cd ~/Scripts
git clone --recursive https://github.com/wang-q/windows

cd ~/Scripts/windows/setup
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "Win10-Initial-Setup-Script/Win10.ps1" -include "Win10-Initial-Setup-Script/Win10.psm1" -preset "Default.preset"

```

# Install packages

```ps1
scoop install curl wget

scoop bucket add extras
scoop bucket add java

```

* Development packages

```ps1
sudo scoop install -g dotnet-sdk
sudo scoop install -g vcredist

sudo scoop install -g openjdk

```

* GUI packages

```ps1
# sudo
sudo scoop install -g everything firefox

# utils
scoop install rufus windirstat

# development
scoop install beyondcompare github vscode winscp

# media
scoop install mpv-git
sudo ~\scoop\apps\mpv-git\current\installer\mpv-install.bat
scoop install handbrake

# others
scoop install notable slack

```

* [C++ Build Tools](https://visualstudio.microsoft.com/visual-cpp-build-tools/)

* Rust

```ps1
# rustup
rustup self update
rustup update
rustup toolchain install nightly-2019-09-05
rustup default nightly-2019-09-05

# Rust Language Server
rustup component add rust-docs rust-src rust-analysis rustfmt
rustup component add rls
cargo install racer

# clippy
rustup component add clippy

# others
cargo install cargo-expand
cargo install cargo-release
cargo install intspan

```

* vscode extensions

```ps1
code --install-extension rust-lang.rust

```

* Windows 7 games: https://winaero.com/download.php?view.1836

* List installed packages

```ps1
scoop list

```
