# esalas.dots

Dotfiles para configurar un entorno de desarrollo en macOS basado en Zsh, Ghostty, Neovim y herramientas de línea de comandos.

> Este repositorio contiene preferencias personales. Revisa las configuraciones y el `Brewfile` antes de instalarlos en tu equipo.

## Componentes principales

- **Terminal:** Ghostty y JetBrains Mono Nerd Font.
- **Shell:** Zsh, Starship y zsh-autosuggestions.
- **Editor:** Neovim con LazyVim e integración con OpenCode.
- **GitHub:** GitHub CLI, gh-dash, lazygit y diffnav.
- **Agentes:** OpenCode y Herdr.
- **CLI:** fzf, fd, ripgrep, bat, eza, zoxide, direnv, Nushell, carapace y otras utilidades.
- **Aplicaciones:** Obsidian.

El inventario de paquetes gestionados por Homebrew está en [`Brewfile`](./Brewfile). `gh-dash` se instala por separado como extensión de GitHub CLI.

## Requisitos

- macOS.
- Conexión a Internet.
- Permisos para instalar las Command Line Tools de Xcode y Homebrew.

La guía contempla equipos Apple Silicon e Intel.

## Instalación

Consulta la guía completa en [`INSTALL.md`](./INSTALL.md). En una instalación nueva, el flujo general es:

```bash
git clone https://github.com/esalas-dev/esalas.dots.git ~/.dotfiles
cd ~/.dotfiles
brew bundle --file=Brewfile
gh extension install dlvhdr/gh-dash
```

Después deben crearse los enlaces simbólicos y realizarse las inicializaciones descritas en la guía. No ejecutes solamente estos comandos si todavía no tienes Homebrew configurado.

## Estructura

| Ruta | Descripción |
| --- | --- |
| `Brewfile` | Paquetes, taps y aplicaciones instalados con Homebrew. |
| `ghostty/` | Configuración, temas y shaders de Ghostty. |
| `nvim/` | Configuración de Neovim y LazyVim. |
| `zshrc/.zshrc` | Configuración, aliases y variables de Zsh. |
| `starship/` | Prompt de Starship. |
| `gh/` | Preferencias no sensibles de GitHub CLI. |
| `gh-dash/` | Dashboard de pull requests, issues y notificaciones. |
| `git/` | Exclusiones globales de Git. |
| `herdr/` | Preferencias compartibles de Herdr. |
| `opencode/` | Configuración, agentes, comandos y plugins de OpenCode. |

## Actualización

```bash
cd ~/.dotfiles
git pull
brew bundle --file=Brewfile
gh extension upgrade dlvhdr/gh-dash
```

Para comprobar si están instaladas todas las dependencias:

```bash
brew bundle check --file=Brewfile
```

## Datos locales y seguridad

No se versionan tokens, credenciales, claves privadas, hosts de GitHub, configuración SSH, identificadores, logs ni datos de sesión. Estos archivos están contemplados en `.gitignore` y deben permanecer locales.

La autenticación de GitHub se configura después de instalar los dotfiles:

```bash
gh auth login
```

La configuración SSH debe mantenerse manualmente en `~/.ssh/config`.

## Personalización

Antes de usar estos dotfiles en otro equipo, revisa especialmente:

- Los aliases y rutas opcionales de `zshrc/.zshrc`.
- Las aplicaciones y fórmulas incluidas en `Brewfile`.
- Los atajos de `gh-dash/config.yml`.
- Los plugins y extras habilitados en `nvim/`.
- El modelo configurado en `opencode/opencode.json`.
