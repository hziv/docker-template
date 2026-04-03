#!/usr/bin/env bash
set -euo pipefail

echo "[postCreate] Starting setup..."

cd /workspace || exit 1

# Ensure uv exists
if ! command -v uv >/dev/null 2>&1; then
  echo "[postCreate] ERROR: uv not found in PATH"
  exit 1
fi

# Sync dependencies
if [ -f "pyproject.toml" ]; then
  echo "[postCreate] Running uv sync..."
  uv sync --frozen
fi

# Ensure ipykernel is available
echo "[postCreate] Ensuring ipykernel..."
uv run python -c "import ipykernel" 2>/dev/null || uv add ipykernel

# Install kernel only if missing
KERNEL_NAME="project-kernel"

if ! uv run python -m jupyter kernelspec list | grep -q "$KERNEL_NAME"; then
  echo "[postCreate] Installing Jupyter kernel..."
  uv run python -m ipykernel install --user \
    --name "$KERNEL_NAME" \
    --display-name "Python ($KERNEL_NAME)"
fi

echo "[postCreate] Setup complete."