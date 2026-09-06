# dotfiles

Personal shell and development environment configuration for Linux and macOS.

## Install

Run this one-line command to clone the repository and link the configuration files:

```sh
git clone https://github.com/jonpetersathan/dotfiles.git ~/.dotfiles && ~/.dotfiles/install.sh
```

The installer creates symlinks for:

- Git configuration at `~/.gitconfig`
- Starship prompt configuration at `~/.config/starship.toml`
- Zsh configuration at `~/.zshrc` and `~/.zshrc.local`
- Tmux configuration at `~/.tmux.conf` when a Tmux configuration is present

Existing files at these destinations are removed before the symlinks are created. Back up any local configuration you want to keep first.

## Included configuration

- `git/.gitconfig` sets the default branch, editor, and Git identity.
- `starship/starship.toml` configures the Starship prompt, including Git, Kubernetes, container, language, and OS indicators.
- `zsh/zshrc` provides the Zsh setup based on Grml.
- `zsh/zshrc.local` initializes Starship when available and adds shell helpers such as `update` and `genpass`.
- `zsh/aliases.zsh` contains Kubernetes, Helm, and Asciinema aliases.

## Updating

Pull the latest changes and rerun the installer:

```sh
git clone https://github.com/jonpetersathan/dotfiles ~/.dotfiles && cd ~/.dotfiles && ./install.sh
```

Starship, Zsh, and any commands used by the aliases are optional dependencies and are not installed by this repository.