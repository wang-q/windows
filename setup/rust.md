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
rustup toolchain add nightly
rustup component add rust-docs rust-src rust-analysis rustfmt

# tools
rustup component add rls
cargo +nightly install racer
rustup component add clippy

# others
cargo install cargo-expand
cargo install cargo-release
cargo install hyperfine
cargo install intspan

```

* vscode extensions

```powershell
# code --install-extension rust-lang.rust
code --install-extension matklad.rust-analyzer
code --install-extension bungcip.better-toml
```

## [`vcpkg`](https://github.com/microsoft/vcpkg)

* Install vcpkg. Open PowerShell as an Administrator

```powershell
scoop install -g cmake

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
