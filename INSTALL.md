# Install Commands

## 1. Homebrew y herramientas base

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
xcode-select --install
brew update
```

## 2. CLI tools principales

```bash
brew install \
  git \
  neovim \
  zsh-autosuggestions \
  fzf \
  fd \
  ripgrep \
  tree \
  bat \
  eza \
  zoxide \
  direnv \
  lazygit \
  gh \
  xh \
  cmatrix \
  ffuf \
  go \
```

## 3. Apps y casks de macOS

```bash
brew install --cask \
  ghostty \
  obsidian \
  font-jetbrains-mono-nerd-font
```

## 4. GitHub dashboard y diff viewer

```bash
brew install dlvhdr/gh-dash/gh-dash
brew install diffnav
```

## 6. Neovim / LazyVim

No requiere comandos extra además de `neovim`. La config clona `lazy.nvim` automáticamente al abrir `nvim` por primera vez.

```bash
go install golang.org/x/tools/gopls@latest
```

