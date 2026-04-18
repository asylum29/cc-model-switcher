#!/usr/bin/env bash
set -euo pipefail

REPO="alvisx/cc-model-switcher"
BRANCH="main"
BIN_NAME="cc-model"
RAW_URL="https://raw.githubusercontent.com/${REPO}/${BRANCH}/${BIN_NAME}"

# Check for Node.js
if ! command -v node &>/dev/null; then
    echo "Error: Node.js is required but not installed." >&2
    exit 1
fi

# Find install directory
INSTALL_DIR="/usr/local/bin"
if [ ! -w "$INSTALL_DIR" ]; then
    INSTALL_DIR="${HOME}/.local/bin"
    mkdir -p "$INSTALL_DIR"
fi

# Download
echo "Downloading ${BIN_NAME}..."
curl -sL "$RAW_URL" -o "${INSTALL_DIR}/${BIN_NAME}"
chmod +x "${INSTALL_DIR}/${BIN_NAME}"

# Add to PATH if needed
if [[ ":$PATH:" != *":${INSTALL_DIR}:"* ]]; then
    SHELL_RC="${HOME}/.$(basename "$SHELL")rc"
    echo "" >> "$SHELL_RC"
    echo "export PATH=\"${INSTALL_DIR}:\$PATH\"" >> "$SHELL_RC"
    echo "Added ${INSTALL_DIR} to PATH in ${SHELL_RC}"
    echo "Run 'source ${SHELL_RC}' or restart your terminal."
fi

echo "Installed: ${INSTALL_DIR}/${BIN_NAME}"
echo "Run 'cc-model help' to get started."
