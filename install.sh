#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> Deploying dotfiles from ${DOTFILES_DIR}..."

# 1. Helper function for safe, idempotent symlinking
link_file() {
    local src="$1"
    local dest="$2"

    mkdir -p "$(dirname "$dest")"
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        rm -rf "$dest"
    fi
    ln -s "$src" "$dest"
    echo "  Linked: $dest -> $src"
}

# 2. Git Configuration
link_file "${DOTFILES_DIR}/git/.gitconfig" "${HOME}/.gitconfig"

# 3. Starship Configuration
link_file "${DOTFILES_DIR}/starship/starship.toml" "${HOME}/.config/starship.toml"

# 4. ZSH / Grml Configuration
# In our containers, /etc/zsh/zshrc and ~/.zshrc automatically source ~/.zshrc.local
link_file "${DOTFILES_DIR}/zsh/zshrc" "${HOME}/.zshrc"
link_file "${DOTFILES_DIR}/zsh/zshrc.local" "${HOME}/.zshrc.local"

# 5. VS Code Configuration
link_file "${DOTFILES_DIR}/vscode/settings.json" "${HOME}/.config/Code/User/settings.json"
link_file "${DOTFILES_DIR}/vscode/settings.json" "${HOME}/.vscode-server/data/Machine/settings.json"

# 6. Tmux (if present)
if [ -f "${DOTFILES_DIR}/tmux/.tmux.conf" ]; then
    link_file "${DOTFILES_DIR}/tmux/.tmux.conf" "${HOME}/.tmux.conf"
fi

echo "==> Dotfiles installation complete!"