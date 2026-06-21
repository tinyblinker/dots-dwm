<p align="center">
  <img src="https://dwm.suckless.org/dwm.svg" width="80" alt="dwm logo" />
</p>

<h3 align="center">shyweeds · dotfiles</h3>

<p align="center">
  <sub>Arch Linux · dwm · Fish · Neovim · Kitty</sub>
  <br>
  <sub><a href="#-structure--目录结构">Structure</a> · <a href="#-quick-start--快速开始">Quick Start</a> · <a href="#-dependencies--依赖">Deps</a> · <a href="#-features--特性">Features</a> · <a href="#-post-install--手动调整">Post-install</a></sub>
</p>

<br>

> A **dwm + Arch Linux** dotfiles suite tailored for C/C++ development.
> Minimal window manager, fully-loaded Neovim, polished terminal experience.
>
> 一套为 **Arch Linux + dwm** 定制的 dotfiles，聚焦 C/C++ 开发体验。
> 窗口管理器简洁高效，编辑器开箱即用，终端美观流畅。

---

## 📁 Structure · 目录结构

```
dotfiles-dwm/
├── deploy.sh                     One-click deploy  /  一键部署
├── nvim/                         Neovim (Lazy.nvim, 16 plugins)  /  编辑器
│   ├── init.lua
│   └── lua/
│       ├── config/               Options, keymaps, autocmds  /  基础配置
│       └── plugins/              One file per plugin  /  插件独立配置
├── kitty/                        GPU-accelerated terminal  /  GPU 终端
├── picom/                        Compositor (GLX, blur, shadows)  /  合成器
├── dunst/                        Notification daemon  /  通知守护
├── lazygit/                      Terminal Git TUI  /  终端 Git
├── yazi/                         Terminal file manager  /  终端文件管理
├── shell_config/
│   ├── bash/.bashrc              Bash (vi mode)  /  Bash 配置
│   └── fish/                     Fish (vi bindings, auto startx)  /  Fish 配置
├── X_configs/
│   ├── .xinitrc                  X11 session (dwm, picom, dunst, fcitx5)
│   └── .Xresources               X resources (DPI 192, font)
├── scripts/
│   ├── dwm_status.sh             DWM status bar  /  状态栏脚本
│   └── wifi_fucking_rescan.sh
├── gdb/                          GDB config (project-specific)  /  调试配置
├── vim_config_bak/               Legacy Vim (replaced by Neovim)  /  旧 Vim
├── my_code_template/cmake/       C++17 CMake template (clang-tidy/clangd)
└── nix-config/                   Nix flake (reproducible env)  /  可复现环境
```

---

## 🚀 Quick Start · 快速开始

```bash
# 1. Clone
git clone https://github.com/shyweeds/dots-dwm.git ~/dotfiles-dwm

# 2. Dry-run — preview what will happen  /  预览将要执行的操作
cd ~/dotfiles-dwm
./deploy.sh -n

# 3. Deploy  /  正式部署
./deploy.sh
```

The deploy script symlinks config files from the repo into `~/.config/` and `$HOME`.

部署脚本通过**软链接**将仓库中的配置文件映射到对应位置。

> **Idempotent · 幂等** — already-linked configs are skipped; safe to re-run.
> <br>**Safe · 安全** — existing files are left untouched; resolve conflicts manually.
>
> 已链接的配置自动跳过，可反复执行。
> 目标路径已有文件时跳过不覆盖，需手动处理冲突。

---

## 📦 Dependencies · 依赖

### Core Software · 核心软件

| Software · 软件 | Purpose · 用途 |
|---|---|
| [dwm](https://dwm.suckless.org) | Dynamic window manager · 动态窗口管理器 |
| [picom](https://github.com/yshui/picom) | Compositor (shadows, blur, transparency) · X11 合成器 |
| [dunst](https://dunst-project.org) | Notification daemon · 通知守护进程 |
| [kitty](https://sw.kovidgoyal.net/kitty/) | GPU-accelerated terminal · GPU 终端 |
| [fish](https://fishshell.com) / bash | Shell |
| [neovim](https://neovim.io) `>= 0.10` | Editor · 编辑器 |
| [fcitx5](https://fcitx-im.org) | Input method · 输入法框架 |
| [feh](https://feh.finalrewind.org) | Wallpaper setter · 壁纸设置 |
| [lazygit](https://github.com/jesseduffield/lazygit) | Terminal Git UI · 终端 Git |
| [yazi](https://yazi-rs.github.io) | Terminal file manager · 终端文件管理 |

### Neovim Plugins · 插件

`<leader>` = `Space`

| Plugin · 插件 | Purpose · 功能 |
|---|---|
| [blink.cmp](https://github.com/Saghen/blink.cmp) | Completion engine · 自动补全 |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP configuration · LSP 服务 |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Auto-formatter · 自动格式化 |
| [nvim-lint](https://github.com/mfussenegger/nvim-lint) | Async linting · 异步 Lint |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting · 语法高亮 |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder · 模糊查找 |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | File tree · 文件树 |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Status line · 状态栏 |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git gutter signs · Git 标记 |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keybinding helper · 键位提示 |
| [flash.nvim](https://github.com/folke/flash.nvim) | Fast navigation · 快速跳转 |
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | Colorscheme · 配色主题 |
| [copilot.lua](https://github.com/zbirenbaum/copilot.lua) | GitHub Copilot |

### Font · 字体

- [JetBrainsMono Nerd Font](https://github.com/ryanoasis/nerd-fonts) — terminal & status bar icons · 终端及状态栏图标

### Arch Linux One-liner · 一键安装

```bash
sudo pacman -S --needed \
  dwm picom dunst kitty fish neovim \
  fcitx5 fcitx5-chinese-addons feh \
  lazygit yazi xorg-xrandr xorg-xrdb

yay -S nerd-fonts-jetbrains-mono  # or download manually  /  或手动下载
```

---

## ✨ Features · 特性

### DWM Desktop · 桌面环境

- **Picom compositor · 合成器** — dual Kawase blur, window shadows, opacity fading · 双 Kawase 模糊、窗口阴影、透明度渐变
- **Custom status bar · 自定义状态栏** — network, battery, volume, power profile, clock · 网络/电池/音量/电源模式/时间
- **Auto-start · 自动启动** — `.xinitrc` launches fcitx5, picom, dunst, wallpaper, status bar · 一键拉起全部组件
- **Rust mirror · Rust 镜像** — Tsinghua TUNA mirrors pre-configured · 已配置清华 TUNA 镜像

### Neovim

- `<Space>` leader key with `which-key` hints · `Space` 作为 Leader 键
- LSP ready: `clangd`, `pyright`, `rust-analyzer`, `lua_ls`
- Auto-format on save · 保存时自动格式化
- Telescope fuzzy finder · Telescope 模糊查找
- Tokyonight colorscheme · Tokyonight 主题

### Terminal · 终端

- **Kitty** — JetBrainsMono 16px, cursor trail effect, pywal16 colors · 光标拖尾
- **Fish** — vi key bindings, auto-start X11 on tty1 · vi 键位
- **Yazi** — show hidden files, <kbd>y</kbd> to cd on exit · <kbd>y</kbd> 自动跳转目录
- **LazyGit** — auto-fetch disabled · 禁用自动 fetch

---

## 📸 Screenshots · 截图

<!-- TODO: add screenshots / 添加截图 -->
<p align="center">
  <em>Coming soon · 即将到来...</em>
</p>

---

## ⚙️ Post-install · 手动调整

After deployment, adjust these to match your machine · 部署后根据实际环境调整：

| File · 文件 | What to change · 需要调整 |
|---|---|
| `~/.xinitrc` | Screen resolution (`xrandr --output eDP --mode`), wallpaper path, input method · 屏幕分辨率、壁纸路径 |
| `~/.Xresources` | DPI value (current `192` for 2K HiDPI) · DPI 值 |
| `~/.config/fish/config.fish` | Machine-specific paths (Cargo, Comate, etc.) · 机器相关路径 |
| `~/.local/bin/dwm_status.sh` | Battery sysfs path (`/sys/class/power_supply/BAT0`) · 电池路径 |

<br>
<p align="center">
  <sub>Made with grit by shyweeds</sub>
</p>
