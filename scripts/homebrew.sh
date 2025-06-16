#!/bin/bash
set -euo pipefail

source ./scripts/utils.sh

# Apple Silicon Homebrew prefix
HOMEBREW_PREFIX="/opt/homebrew"

# Check if Homebrew is installed
check_homebrew() {
    if ! command -v brew &> /dev/null; then
        log_error "Homebrew is not installed!"
        log_info "Install it from: https://brew.sh/"
        exit 1
    fi
    log_success "Homebrew found at $(which brew)"
}

# Check if Brewfile exists
check_brewfile() {
    if [[ ! -f "Brewfile" ]]; then
        log_error "Brewfile not found in current directory!"
        log_info "Make sure you're running this from your dotfiles root directory"
        exit 1
    fi
    log_success "Brewfile found"
}

main() {
    log_info "Starting Homebrew package installation using Brewfile..."

    # Set up environment for Apple Silicon
    export PATH="$HOMEBREW_PREFIX/bin:$PATH"

    # Check prerequisites
    check_homebrew
    check_brewfile

    # Update Homebrew
    log_info "Updating Homebrew..."
    brew update || {
        log_error "Failed to update Homebrew"
        exit 1
    }

    # Install bundle command if not available
    if ! brew bundle --help &> /dev/null; then
        log_info "Installing brew-bundle..."
        brew tap homebrew/bundle
    fi

    # Install packages from Brewfile
    log_info "Installing packages from Brewfile..."
    brew bundle install --verbose || {
        log_error "Some packages failed to install"
        log_info "You can run 'brew bundle install' manually to retry failed installations"
    }

    # Post-installation setup
    log_info "Running post-installation setup..."

    # Link gettext if needed
    if [[ ! -L "$HOMEBREW_PREFIX/bin/msgfmt" ]]; then
        log_info "Linking gettext..."
        brew link --force gettext || log_warning "Failed to link gettext"
    fi

    # Create sha256sum symlink for compatibility
    if [[ ! -L "$HOMEBREW_PREFIX/bin/sha256sum" ]] && [[ -f "$HOMEBREW_PREFIX/bin/gsha256sum" ]]; then
        log_info "Creating sha256sum symlink..."
        ln -sf "$HOMEBREW_PREFIX/bin/gsha256sum" "$HOMEBREW_PREFIX/bin/sha256sum"
    fi

    # Install fzf shell integration
    log_info "Setting up fzf shell integration..."
    yes | "$HOMEBREW_PREFIX/opt/fzf/install" || log_warning "fzf install script failed"

    # Install Python packages for Neovim
    log_info "Installing Python packages for Neovim..."
    if command -v pip3 &> /dev/null; then
        pip3 install --user --break-system-packages neovim pynvim || log_warning "Failed to install Python packages"
    else
        log_warning "pip3 not found, skipping Python packages"
    fi

    # Cleanup
    log_info "Cleaning up..."
    brew cleanup || log_warning "Cleanup failed"

    # Show installation summary
    log_success "Installation completed!"

    log_info "Installation summary:"
    log_info "  📦 Formulae: $(brew list | wc -l | tr -d ' ')"
    log_info "  🍺 Casks: $(brew list --cask | wc -l | tr -d ' ')"
    log_info "  🏷️  Taps: $(brew tap | wc -l | tr -d ' ')"

    log_success "Homebrew setup completed successfully!"

    # Helpful next steps
    echo
    log_info "Next steps:"
    echo "  • Restart your terminal or run: source ~/.zshrc"
    echo "  • Check for any failed installations: brew bundle check"
    echo "  • Update packages anytime with: brew bundle install"
}

# Run main function
main "$@""Installing homebrew ..."
