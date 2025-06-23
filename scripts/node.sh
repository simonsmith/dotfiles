#!/bin/bash
set -euo pipefail

source ./scripts/utils.sh

log_info "Setting up mise for Node.js development..."

# Check if mise is available
if ! command -v mise &> /dev/null; then
    log_error "mise not found. Install mise first via homebrew."
    exit 1
fi

# Install tools from global config
log_info "Installing tools from global mise configuration..."
mise trust ~/.config/mise.toml
mise install

log_success "mise setup completed!"
