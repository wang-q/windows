# Rust and C/C++

## [C++ Build Tools](https://visualstudio.microsoft.com/visual-cpp-build-tools/)

Select `Desktop development with C++` and Language packs English/Chinese

## docs from Microsoft

https://docs.microsoft.com/en-us/windows/dev-environment/rust/setup

## [`rustup`](https://rustup.rs/)

```powershell
# rustup
rustup self update
rustup update
rustup component add clippy rust-analysis rust-src rustfmt

cargo install cargo-expand
cargo install cargo-release
cargo install cargo-binstall
cargo binstall cargo-tarpaulin

cargo install intspan
cargo install nwr

```

* vscode extensions

```powershell
# code --install-extension rust-lang.rust
# code --install-extension matklad.rust-analyzer
# code --install-extension bungcip.better-toml

```

> Due to it's design IO between the host (Windows) and virtual machine (distro inside WSL2) is slow and the latency is enormous.
> With WSL2 you should be always compiling your project from Linux filesystem and not from Windows mounted directories

https://github.com/rust-lang/rust/issues/55684#issuecomment-734433698

## [`vcpkg`](https://github.com/microsoft/vcpkg)

* Install vcpkg. Open PowerShell as an Administrator

```powershell
scoop install cmake

cd c:/
git clone https://github.com/Microsoft/vcpkg.git

cd c:/vcpkg
./bootstrap-vcpkg.bat

./vcpkg integrate install

# Add to Path
[Environment]::SetEnvironmentVariable(
    "Path",
    [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine) + ";C:\vcpkg",
    [EnvironmentVariableTarget]::Machine)

```

* Install some packages

```powershell
vcpkg install zlib curl sqlite3

```
