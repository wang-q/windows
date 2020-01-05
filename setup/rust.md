# Rust

## [C++ Build Tools](https://visualstudio.microsoft.com/visual-cpp-build-tools/)

Select `Desktop development with C++` and Language packs English/Chinese

## [`rustup`](https://rustup.rs/)

```ps1
# rustup
rustup self update
rustup update
rustup toolchain install nightly
rustup default nightly

# Rust Language Server
rustup component add rust-docs rust-src rust-analysis rustfmt
rustup component add rls
cargo install racer

# clippy
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

* Install vcpkg

```ps1
sudo scoop install -g cmake

cd c:/
git clone https://github.com/Microsoft/vcpkg.git

cd c:/vcpkg
./bootstrap-vcpkg.bat

./vcpkg integrate install

# Add to Path
sudo [Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\vcpkg", "Machine")

```

* Install some packages

```ps1
vcpkg install zlib curl 

```
