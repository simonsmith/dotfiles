#!/bin/bash
set -euo pipefail

source ./scripts/utils.sh

# Apple Silicon Homebrew prefix
HOMEBREW_PREFIX="/opt/homebrew"

main() {
    log_info "Setting up additional tools and configurations..."

    # Install tmux plugin manager
    log_info "Installing tmux plugin manager (tpm)..."
    if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm || {
            log_error "Failed to clone tpm repository"
        }
        log_success "tpm installed"
    else
        log_warning "tpm already installed"
    fi

    # Initialize theme (default dark)
    log_info "Initializing theme..."
    if [[ -x "$HOME/dotfiles/bin/theme" ]]; then
        "$HOME/dotfiles/bin/theme" dark
        log_success "Theme initialized"
    else
        log_warning "Theme script not found; skipping theme initialization"
    fi

    # Install znap plugin manager for zsh
    log_info "Installing znap plugin manager..."
    mkdir -p ~/.zsh-plugins/.znap

    if [[ ! -d "$HOME/.zsh-plugins/.znap/.git" ]]; then
        git clone https://github.com/marlonrichert/zsh-snap ~/.zsh-plugins/.znap || {
            log_error "Failed to clone znap repository"
        }
        log_success "znap plugin manager installed"
    else
        log_warning "znap already installed"
    fi

    log_success "Additional tools setup completed!"

    log_info "Manual steps remaining:"
    echo "  • Open a new shell to trigger znap install"
    echo "  • In tmux, press 'prefix + I' to install tmux plugins"
}

# Run main function
main "$@"
