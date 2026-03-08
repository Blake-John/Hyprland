#!/usr/bin/env bash
# convert - convert json color file to configurations

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENV_DIR="$SCRIPT_DIR/../.venv"
PROJECT_DIR="$SCRIPT_DIR/.."

if [ ! -d "$VENV_DIR" ]; then
    cd "$PROJECT_DIR" && uv venv .venv && uv pip install -e .
fi

exec "$VENV_DIR/bin/convertor" "$@"
