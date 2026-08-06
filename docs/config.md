# Configuration Guide for Codeek

Codeek uses TOML configuration files located at `~/.codeek/config.toml` (or standard environment variables).

## Default Settings

- **Provider**: DeepInfra (`https://api.deepinfra.com/v1/openai`)
- **Default Model**: `deepseek-ai/DeepSeek-V4-Flash-0731`
- **Thinking Mode**: `thinking` (`reasoning_effort="max"`)

## Configuration Options

```toml
model = "deepseek-ai/DeepSeek-V4-Flash-0731"
model_provider = "deepinfra"

[model_providers.deepinfra]
base_url = "https://api.deepinfra.com/v1/openai"
env_key = "DEEPINFRA_API_KEY"
```

## Thinking Mode Presets

- `codeek-v4-max`: Maximum reasoning effort.
- `codeek-v4-high`: High reasoning effort.
- `codeek-v4-medium`: Balanced reasoning effort.
- `codeek-v4-low`: Low reasoning effort.
