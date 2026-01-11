#!/usr/bin/env zsh
# Kinasha Zsh Plugin
# A collection of useful functions and aliases

# ============================================================================
# Custom Functions
# ============================================================================

# Create a temporary directory with timestamp and cd into it
,cdtmp() {
  mkdir -p /tmp/$(date +%Y%m%d%H%M%S)
  cd /tmp/$(date +%Y%m%d%H%M%S)
}

# Source/reload zshrc
,smz() {
  source ~/.zshrc
}

# paste clipboard to file
,paste() {
  pbpaste > $1
}

# ============================================================================
# Aliases
# ============================================================================

# pnpm alias
alias ,p='pnpm'

# ============================================================================
# Environment Variables
# ============================================================================

# Proxy settings (can be overridden by user)
if [[ -z "$http_proxy" ]]; then
  export http_proxy=http://localhost:7897
  export https_proxy=$http_proxy
fi

# ============================================================================
# pnpm Configuration
# ============================================================================

# Set pnpm home directory
if [[ -z "$PNPM_HOME" ]]; then
  export PNPM_HOME="$HOME/Library/pnpm"
fi

# Add pnpm to PATH if not already present
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# ============================================================================
# Optional: fnm (Fast Node Manager) support
# ============================================================================

# Uncomment the following line if you want to enable fnm support
# eval "$(fnm env --use-on-cd --shell zsh)"
