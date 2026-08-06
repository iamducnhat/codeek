#!/usr/bin/env bash
set -e

echo "Installing Codeek CLI..."

# Check cargo dependency
if ! command -v cargo >/dev/null 2>&1; then
    echo "Error: Rust and Cargo are required to build Codeek."
    echo "Please install Rust from https://rustup.rs/ and try again."
    exit 1
fi

TEMP_DIR=""

if [ -d "codex-rs" ] && [ -f "codex-rs/Cargo.toml" ]; then
    BUILD_DIR="$(pwd)"
else
    TEMP_DIR=$(mktemp -d /tmp/codeek_install_XXXXXX)
    echo "Cloning Codeek source repository..."
    git clone --depth 1 https://github.com/iamducnhat/codeek.git "$TEMP_DIR"
    BUILD_DIR="$TEMP_DIR"
fi

echo "Building Codeek release executable..."
cd "$BUILD_DIR/codex-rs"
cargo build --release --bin codex

BINARY_SOURCE="$BUILD_DIR/codex-rs/target/release/codex"

if [ ! -f "$BINARY_SOURCE" ]; then
    echo "Error: Compilation failed. Binary not found at $BINARY_SOURCE"
    [ -n "$TEMP_DIR" ] && rm -rf "$TEMP_DIR"
    exit 1
fi

TARGET_DIR=""
if [ -w "/usr/local/bin" ]; then
    TARGET_DIR="/usr/local/bin"
else
    TARGET_DIR="$HOME/.local/bin"
    mkdir -p "$TARGET_DIR"
fi

cp "$BINARY_SOURCE" "$TARGET_DIR/codeek"
chmod +x "$TARGET_DIR/codeek"

[ -n "$TEMP_DIR" ] && rm -rf "$TEMP_DIR"

echo "Codeek installed successfully to $TARGET_DIR/codeek."
echo ""
echo "To get started, set your API key and run Codeek:"
echo "  export DEEPINFRA_API_KEY=\"your-deepinfra-api-key\""
echo "  codeek"
