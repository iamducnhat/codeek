# Codeek CLI

Codeek is a command-line coding agent powered by DeepInfra and DeepSeek AI. It runs locally on your computer, enabling interactive agentic software development, automated code execution, git patch creation, and multi-file editing.

Default Model: `deepseek-ai/DeepSeek-V4-Flash-0731` with thinking mode enabled (`reasoning_effort="max"` / `codeek-v4-max`).

---

## Quickstart

### Environment Setup

Set your DeepInfra API Key in your terminal:

```shell
export DEEPINFRA_API_KEY="your-deepinfra-api-key"
```

Alternatively, log in using the command-line interface:

```shell
codeek login
```

Credentials will be saved securely to `~/.codeek/credentials.json`.

---

## Usage

### Interactive Shell

Run `codeek` to start an interactive session:

```shell
codeek
```

### Direct Instruction Execution

Execute single commands or non-interactive tasks:

```shell
codeek exec "Refactor functions in Sources/ to use async/await"
```

### Thinking Mode & Model Presets

Codeek defaults to DeepSeek-V4-Flash-0731 with maximum reasoning effort. Thinking display presets include:

- `codeek-v4-max`: Maximum reasoning effort for complex architectural refactoring.
- `codeek-v4-high`: High reasoning effort for bug fixes and feature development.
- `codeek-v4-medium`: Balanced reasoning effort for standard code reviews and edits.
- `codeek-v4-low`: Low reasoning effort for quick lookups and documentation formatting.

To specify a custom model or preset:

```shell
codeek --model deepseek-ai/DeepSeek-V4-Flash-0731
```

---

## Building from Source

Ensure Rust and Cargo are installed on your system.

```shell
# Clone the repository
git clone https://github.com/iamducnhat/codeek.git
cd codeek/codex-rs

# Build release binary
cargo build --release --bin codex

# Copy binary to system path
cp target/release/codex /usr/local/bin/codeek
```

---

## License

This repository is licensed under the Apache-2.0 License.
