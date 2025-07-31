#!/bin/bash
set -euo pipefail

source ./scripts/utils.sh

main() {
    log_info "Installing Rust..."

    # Check if rustup is already installed
    if command -v rustup &> /dev/null; then
        log_warning "Rust is already installed"
        return 0
    fi

    # Install rustup
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

    log_success "Rust installed!"
}

# Run main function
main "$@"
