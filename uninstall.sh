#!/usr/bin/env bash
set -e

echo "Uninstalling Codeek CLI..."

REMOVED=0

if [ -f "/usr/local/bin/codeek" ]; then
    rm -f "/usr/local/bin/codeek"
    echo "Removed /usr/local/bin/codeek"
    REMOVED=1
fi

if [ -f "$HOME/.local/bin/codeek" ]; then
    rm -f "$HOME/.local/bin/codeek"
    echo "Removed $HOME/.local/bin/codeek"
    REMOVED=1
fi

if [ -d "$HOME/.codeek" ]; then
    rm -rf "$HOME/.codeek"
    echo "Removed $HOME/.codeek configuration directory"
    REMOVED=1
fi

if [ "$REMOVED" -eq 1 ]; then
    echo "Codeek CLI uninstalled successfully."
else
    echo "No Codeek installation found."
fi
