# A command to install or update Rust using RustUp.

# Usage: install-rust

Write-Host "Installing RustUp."
scoop install cone/rustup
Write-Host "Adding toolchain: stable"
rustup toolchain add stable
Write-Host "Updating Toolchains"
rustup update
Write-Host "RustUp has been installed."