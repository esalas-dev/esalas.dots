# Instalación de los dotfiles

Guía para macOS. El `Brewfile` instala las aplicaciones y herramientas seleccionadas para este entorno.

## 1. Instalar las Command Line Tools

Comprueba si ya están disponibles:

```bash
xcode-select -p
```

Si el comando falla, inicia la instalación y espera a que finalice antes de continuar:

```bash
xcode-select --install
```

## 2. Instalar Homebrew

```bash
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi
```

Añade el entorno de Homebrew al perfil, usando la ruta mostrada al terminar su instalación. En Apple Silicon:

```bash
grep -Fq 'eval "$(/opt/homebrew/bin/brew shellenv)"' ~/.zprofile 2>/dev/null || \
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
```

## 3. Clonar el repositorio

El resto de la guía asume que el repositorio está en `~/.dotfiles`:

```bash
git clone https://github.com/esalas-dev/esalas.dots.git ~/.dotfiles
cd ~/.dotfiles
```

Si el repositorio ya existe, actualízalo con `git pull` en lugar de volver a clonarlo.

## 4. Instalar los paquetes del entorno

```bash
brew update
brew bundle --file="$HOME/.dotfiles/Brewfile"
```

`gh-dash` se distribuye como una extensión de GitHub CLI. Instálala o actualízala con:

```bash
if gh extension list | grep -q 'dlvhdr/gh-dash'; then
  gh extension upgrade dlvhdr/gh-dash
else
  gh extension install dlvhdr/gh-dash
fi
```

`gopls` no forma parte del `Brewfile` y su instalación automática mediante Mason está desactivada. La configuración del servidor seguirá disponible si se instala manualmente más adelante.

## 5. Enlazar las configuraciones

Los comandos siguientes respaldan cualquier destino existente antes de crear los enlaces:

```bash
cd ~/.dotfiles
mkdir -p ~/.config
backup_suffix="backup.$(date +%Y%m%d%H%M%S)"

for name in gh gh-dash ghostty git herdr nvim opencode starship; do
  target="$HOME/.config/$name"
  if [[ -e "$target" || -L "$target" ]]; then
    mv "$target" "$target.$backup_suffix"
  fi
  ln -s "$HOME/.dotfiles/$name" "$target"
done

if [[ -e "$HOME/.zshrc" || -L "$HOME/.zshrc" ]]; then
  mv "$HOME/.zshrc" "$HOME/.zshrc.$backup_suffix"
fi
ln -s "$HOME/.dotfiles/zshrc/.zshrc" "$HOME/.zshrc"
```

Reinicia la shell para cargar la configuración:

```bash
exec zsh
```

## 6. Inicializar aplicaciones

Autentica GitHub localmente. El archivo de autenticación generado no se versiona:

```bash
gh auth login
```

Abre Neovim para que LazyVim descargue sus plugins:

```bash
nvim
```

La configuración SSH contiene hosts, usuarios y rutas privadas, por lo que debe crearse manualmente en `~/.ssh/config` y permanecer fuera del repositorio.

## 7. Verificar la instalación

```bash
brew bundle check --file="$HOME/.dotfiles/Brewfile"
git --version
nvim --version
gh --version
gh dash --version
starship --version
```

Para diagnosticar problemas generales de Homebrew:

```bash
brew doctor
```

## Actualización

```bash
cd ~/.dotfiles
git pull
brew bundle --file=Brewfile
gh extension upgrade dlvhdr/gh-dash
```

Los tokens, credenciales, configuraciones SSH, identificadores, logs y datos de sesión son locales y están excluidos mediante `.gitignore`.
