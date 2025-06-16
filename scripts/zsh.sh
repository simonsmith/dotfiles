#!/bin/bash
set -euo pipefail

source ./scripts/utils.sh

# Apple Silicon Homebrew zsh path
ZSH_PATH="/opt/homebrew/bin/zsh"

main() {
    log_info "Setting up zsh as default shell..."

    # Check if Homebrew zsh is installed
    if [[ ! -f "$ZSH_PATH" ]]; then
        log_error "Homebrew zsh not found at $ZSH_PATH"
        log_info "Make sure you've run the Homebrew installation first"
        exit 1
    fi

    # Check if zsh is already in allowed shells
    if grep -Fxq "$ZSH_PATH" /etc/shells; then
        log_success "Zsh already in allowed shells list"
    else
        log_info "Adding zsh to list of accepted shells..."
        echo "$ZSH_PATH" | sudo tee -a /etc/shells > /dev/null
        log_success "Added zsh to /etc/shells"
    fi

    # Check current shell
    current_shell=$(dscl . -read ~/ UserShell | awk '{print $2}')

    if [[ "$current_shell" == "$ZSH_PATH" ]]; then
        log_success "Zsh is already the default shell"
    else
        log_info "Current shell: $current_shell"
        log_info "Setting zsh as default shell..."
        chsh -s "$ZSH_PATH" || {
            log_error "Failed to change default shell"
            log_info "You may need to restart Terminal and try again"
            exit 1
        }
        log_success "Default shell changed to zsh"
        log_warning "You'll need to restart your terminal for this to take effect"
    fi
}

# Run main function
main "$@"
