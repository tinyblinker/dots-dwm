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
├── nvim/                         Neovim (Lazy.nvim, 15 plugins)
│   ├── init.lua
│   ├── lazy-lock.json            Locked plugin versions
│   └── lua/
│       ├── config/               Options, keymaps, autocmds, lazy bootstrap
│       └── plugins/              One file per plugin
├── kitty/                        GPU-accelerated terminal
├── picom/                        Compositor (GLX, blur, shadows, fading)
├── dunst/                        Notification daemon
├── lazygit/                      Terminal Git TUI
├── yazi/                         Terminal file manager
├── shell_config/
│   ├── bash/.bashrc              Bash (vi mode, Rust mirror, aliases)
│   └── fish/                     Fish config + variables (vi bindings, auto startx on tty1)
├── X_configs/
│   ├── .xinitrc                  X11 session (launches dwm, picom, dunst, fcitx5, feh)
│   └── .Xresources               X resources (DPI 192, JetBrains Mono 17px)
├── scripts/
│   ├── dwm_status.sh             DWM status bar (network / battery / volume / power / time)
│   ├── battery_checker.sh        Low-battery notification + auto-hibernate
│   └── wifi_fucking_rescan.sh
├── systemd/user/                 Systemd user units
│   ├── battery.timer             Periodic battery check (every 60s)
│   └── battery.service           Oneshot battery monitor service
├── code_config/                  VSCode / VSCodium config
│   ├── settings.json             Format-on-save, neovim extension
│   └── keybindings.json          Custom suggestion keybindings
├── gdb/                          GDB config (project-specific)
├── vim_config_bak/               Legacy Vim config (superseded by Neovim)
├── my_code_template/cmake/       C++17 CMake template (clang-tidy, clangd, clang-format)
└── nix-config/                   Nix flake (reproducible dev tools: shellharden, ruff, nixd, …)
```

---

## 🚀 Quick Start

```bash
# 1. Clone
git clone https://github.com/shyweeds/dots-dwm.git ~/dotfiles-dwm
```

### Manual Deployment

Symlink config files from the repo into your home directory:

```bash
# Configs → ~/.config/
ln -sfn ~/dotfiles-dwm/nvim        ~/.config/nvim
ln -sfn ~/dotfiles-dwm/kitty       ~/.config/kitty
ln -sfn ~/dotfiles-dwm/picom       ~/.config/picom
ln -sfn ~/dotfiles-dwm/dunst       ~/.config/dunst
ln -sfn ~/dotfiles-dwm/lazygit     ~/.config/lazygit
ln -sfn ~/dotfiles-dwm/yazi        ~/.config/yazi

# Shell configs
ln -sf ~/dotfiles-dwm/shell_config/bash/.bashrc  ~/.bashrc
ln -sfn ~/dotfiles-dwm/shell_config/fish         ~/.config/fish

# X11 configs
ln -sf ~/dotfiles-dwm/X_configs/.xinitrc     ~/.xinitrc
ln -sf ~/dotfiles-dwm/X_configs/.Xresources  ~/.Xresources

# Scripts
mkdir -p ~/.local/bin
ln -sf ~/dotfiles-dwm/scripts/dwm_status.sh        ~/.local/bin/dwm_status.sh
ln -sf ~/dotfiles-dwm/scripts/battery_checker.sh   ~/.local/bin/battery_checker.sh
ln -sf ~/dotfiles-dwm/scripts/wifi_fucking_rescan.sh ~/.local/bin/wifi_fucking_rescan.sh

# Systemd user units (battery monitoring)
mkdir -p ~/.config/systemd/user
ln -sf ~/dotfiles-dwm/systemd/user/battery.timer   ~/.config/systemd/user/battery.timer
ln -sf ~/dotfiles-dwm/systemd/user/battery.service ~/.config/systemd/user/battery.service
systemctl --user daemon-reload
systemctl --user enable --now battery.timer

# Optional
# ln -sf ~/dotfiles-dwm/gdb/gdbinit_bak ~/.gdbinit
# ln -sf ~/dotfiles-dwm/vim_config_bak/.vimrc ~/.vimrc
```

> **Safe** — use `ln -sf` to overwrite existing symlinks; back up real files first.
> <br>**Idempotent** — safe to re-run; symlinks are just overwritten.

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
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto-pair brackets |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Indent guides |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | Highlight TODO/FIXME |

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
- **Battery monitor** — systemd timer checks every 60s, notifies at ≤20%, auto-hibernates at ≤10%
- **Auto-start** — `.xinitrc` launches fcitx5, picom, dunst, wallpaper, and the status bar
- **Rust mirror** — Tsinghua TUNA mirrors pre-configured in shell

### Neovim

- `<Space>` leader with `which-key` hints
- LSP ready: `clangd`, `pyright`, `rust-analyzer`, `lua_ls`, `nixd`
- Auto-format on save, async linting
- Telescope fuzzy finder, Flash fast jump
- Tokyonight colorscheme

### Terminal

- **Kitty** — JetBrainsMono 16px, cursor trail, pywal16 colors, remote control
- **Fish** — vi key bindings, auto-start X11 on tty1
- **Yazi** — show hidden files, <kbd>y</kbd> to cd on exit
- **LazyGit** — auto-fetch disabled

### Extras

- **Nix flake** — reproducible dev environment (shellharden, ruff, nixfmt, nixd, stylua, …)
- **VSCode** — format-on-save, neovim extension, custom suggestion keybindings
- **C++ template** — CMake 4.2 + clangd + clang-tidy + clang-format boilerplate

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
