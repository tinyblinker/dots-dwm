<p align="center">
  <img src="https://dwm.suckless.org/dwm.svg" width="80" alt="dwm logo" />
</p>

<h3 align="center">shyweeds · dotfiles</h3>

<p align="center">
  <sub>Arch Linux · dwm · Fish · Neovim · Kitty</sub>
</p>

<p align="center">
  <a href="#-structure">Structure</a> ·
  <a href="#-quick-start">Quick Start</a> ·
  <a href="#-dependencies">Deps</a> ·
  <a href="#-features">Features</a> ·
  <a href="#-post-install">Post-install</a>
</p>

<p align="center">
  <a href="README_CN.md">🇨🇳 中文</a>
</p>

<br>

> A **dwm + Arch Linux** dotfiles suite tailored for C/C++ development.
> Minimal window manager, fully-loaded Neovim, polished terminal experience.

---

## 📁 Structure

```
dotfiles-dwm/
├── deploy.sh                     One-click deploy script
├── nvim/                         Neovim (Lazy.nvim, 16 plugins)
│   ├── init.lua
│   └── lua/
│       ├── config/               Options, keymaps, autocmds
│       └── plugins/              One file per plugin
├── kitty/                        GPU-accelerated terminal
├── picom/                        Compositor (GLX, blur, shadows, fading)
├── dunst/                        Notification daemon
├── lazygit/                      Terminal Git TUI
├── yazi/                         Terminal file manager
├── shell_config/
│   ├── bash/.bashrc              Bash (vi mode, Rust mirror, aliases)
│   └── fish/                     Fish (vi bindings, auto startx on tty1)
├── X_configs/
│   ├── .xinitrc                  X11 session (launches dwm, picom, dunst, fcitx5, feh)
│   └── .Xresources               X resources (DPI 192, JetBrains Mono 17px)
├── scripts/
│   ├── dwm_status.sh             DWM status bar (network / battery / volume / power / time)
│   └── wifi_fucking_rescan.sh
├── gdb/                          GDB config (project-specific)
├── vim_config_bak/               Legacy Vim config (superseded by Neovim)
├── my_code_template/cmake/       C++17 CMake template (clang-tidy, clangd, clang-format)
└── nix-config/                   Nix flake (reproducible dev environment)
```

---

## 🚀 Quick Start

```bash
# 1. Clone
git clone https://github.com/shyweeds/dots-dwm.git ~/dotfiles-dwm

# 2. Dry-run — preview what will happen
cd ~/dotfiles-dwm
./deploy.sh -n

# 3. Deploy
./deploy.sh
```

The deploy script symlinks config files from the repo into `~/.config/` and `$HOME`.

> **Idempotent** — already-linked configs are skipped; safe to re-run.
> <br>**Safe** — existing files are left untouched; resolve conflicts manually.

---

## 📦 Dependencies

### Core Software

| Software | Purpose |
|---|---|
| [dwm](https://dwm.suckless.org) | Dynamic window manager |
| [picom](https://github.com/yshui/picom) | Compositor (shadows, blur, transparency) |
| [dunst](https://dunst-project.org) | Notification daemon |
| [kitty](https://sw.kovidgoyal.net/kitty/) | GPU-accelerated terminal |
| [fish](https://fishshell.com) / bash | Shell |
| [neovim](https://neovim.io) `>= 0.10` | Editor |
| [fcitx5](https://fcitx-im.org) | Input method framework |
| [feh](https://feh.finalrewind.org) | Wallpaper setter |
| [lazygit](https://github.com/jesseduffield/lazygit) | Terminal Git UI |
| [yazi](https://yazi-rs.github.io) | Terminal file manager |

### Neovim Plugins

`<leader>` = `Space`

| Plugin | Purpose |
|---|---|
| [blink.cmp](https://github.com/Saghen/blink.cmp) | Completion engine |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP configuration |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Auto-formatter |
| [nvim-lint](https://github.com/mfussenegger/nvim-lint) | Async linting |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | File tree |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Status line |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git gutter signs |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keybinding helper |
| [flash.nvim](https://github.com/folke/flash.nvim) | Fast navigation |
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | Colorscheme |
| [copilot.lua](https://github.com/zbirenbaum/copilot.lua) | GitHub Copilot |

### Font

- [JetBrainsMono Nerd Font](https://github.com/ryanoasis/nerd-fonts)

### Arch Linux One-liner

```bash
sudo pacman -S --needed \
  dwm picom dunst kitty fish neovim \
  fcitx5 fcitx5-chinese-addons feh \
  lazygit yazi xorg-xrandr xorg-xrdb

yay -S nerd-fonts-jetbrains-mono
```

---

## ✨ Features

### DWM Desktop

- **Picom** — dual Kawase blur, window shadows, opacity fading, GLX backend
- **Status bar** — real-time network, battery, volume, power profile, clock
- **Auto-start** — `.xinitrc` launches fcitx5, picom, dunst, wallpaper, and the status bar
- **Rust mirror** — Tsinghua TUNA mirrors pre-configured in shell

### Neovim

- `<Space>` leader with `which-key` hints
- LSP ready: `clangd`, `pyright`, `rust-analyzer`, `lua_ls`
- Auto-format on save, async linting
- Telescope fuzzy finder, Flash fast jump
- Tokyonight colorscheme

### Terminal

- **Kitty** — JetBrainsMono 16px, cursor trail, pywal16 colors, remote control
- **Fish** — vi key bindings, auto-start X11 on tty1
- **Yazi** — show hidden files, <kbd>y</kbd> to cd on exit
- **LazyGit** — auto-fetch disabled

---

## 📸 Screenshots

<!-- TODO: add screenshots -->
<p align="center">
  <em>Coming soon...</em>
</p>

---

## ⚙️ Post-install

After deployment, adjust the following to match your machine:

| File | What to change |
|---|---|
| `~/.xinitrc` | Screen resolution (`xrandr --output eDP --mode`), wallpaper path, input method |
| `~/.Xresources` | DPI value (current `192` for 2K HiDPI) |
| `~/.config/fish/config.fish` | Machine-specific paths (Cargo, Comate, etc.) |
| `~/.local/bin/dwm_status.sh` | Battery sysfs path (`/sys/class/power_supply/BAT0`) |

<br>
<p align="center">
  <sub>Made with grit by shyweeds</sub>
</p>
