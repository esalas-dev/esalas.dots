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
stow \
git \
neovim \
tmux \
zellij \
starship \
zsh-autosuggestions \
fzf \
fd \
ripgrep \
tree \
bat \
eza \
zoxide \
direnv \
ranger \
lazygit \
gh \
go \
rust \
awscli \
kubectl \
kubectx \
xh \
cmatrix \
nmap \
ffuf \
gobuster \
ngrok
```

## 3. Apps y casks de macOS

```bash
brew tap nikitabobko/tap
brew tap FelixKratz/formulae
brew tap anomalyco/tap

brew install --cask \

nikitabobko/tap/aerospace \
wezterm \
ghostty \
docker \
obsidian \
slack \

font-jetbrains-mono-nerd-font


brew install \
FelixKratz/formulae/sketchybar \
FelixKratz/formulae/borders \
anomalyco/tap/opencode

```

## 4. GitHub dashboard y diff viewer

```bash
brew install dlvhdr/gh-dash/gh-dash
brew install diffnav
```

## 5. TPM para tmux

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Después de abrir tmux, instalar plugins con:

```bash
prefix + I
```

En esta config el prefix es `Ctrl+A`, así que normalmente sería `Ctrl+A` y luego `I`.

## 6. Neovim / LazyVim

No requiere comandos extra además de `neovim`. La config clona `lazy.nvim` automáticamente al abrir `nvim` por primera vez.

```bash

nvim

```

Para Go, estos dotfiles esperan `gopls` vía Mason/LazyVim o instalado manualmente:

```bash

go install golang.org/x/tools/gopls@latest

```

## 7. Sketchybar helper

Después de aplicar los symlinks con Stow:

```bash

make -C ~/.config/sketchybar/helper
brew services start sketchybar

```

## 8. OpenCode

Opción recomendada por Homebrew:

```bash

brew install anomalyco/tap/opencode

```

Alternativa oficial con script:

```bash

curl -fsSL https://opencode.ai/install | bash

```

Luego autenticar dentro del TUI:

```bash

opencode

```

Dentro de OpenCode ejecutar `/connect`.

## 9. Herramientas security opcionales

Estas aparecen referenciadas en aliases del `.zshrc`.

```bash

brew install massdns

go install github.com/tomnomnom/gf@latest

git clone https://github.com/danielmiessler/SecLists.git ~/hacking/SecLists

```
