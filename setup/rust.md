# Rust and C/C++

## [C++ Build Tools](https://visualstudio.microsoft.com/visual-cpp-build-tools/)

Select `Desktop development with C++` and Language packs English/Chinese

## [`rustup`](https://rustup.rs/)

```ps1
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

```ps1
code --install-extension rust-lang.rust

```

## [`vcpkg`](https://github.com/microsoft/vcpkg)

* Install vcpkg. Open PowerShell as an Administrator

```ps1
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

```ps1
vcpkg install zlib curl sqlite3

```
