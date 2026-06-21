<p align="center">
  <img src="https://dwm.suckless.org/dwm.svg" width="80" alt="dwm logo" />
</p>

<h3 align="center">shyweeds · dotfiles</h3>

<p align="center">
  <sub>Arch Linux · dwm · Fish · Neovim · Kitty</sub>
</p>

<p align="center">
  <a href="#-目录结构"><b>结构</b></a> ·
  <a href="#-快速部署"><b>部署</b></a> ·
  <a href="#-依赖"><b>依赖</b></a> ·
  <a href="#-特性"><b>特性</b></a> ·
  <a href="#-截图"><b>截图</b></a>
</p>

<br>

> 一套为 **Arch Linux + dwm** 定制的 dotfiles，聚焦 C/C++ 开发体验。
> 窗口管理器简洁高效，编辑器开箱即用，终端美观流畅。

---

## 📁 目录结构

```
dotfiles-dwm/
├── deploy.sh                 # 一键部署脚本
├── nvim/                     # Neovim 编辑器 (Lazy.nvim)
│   ├── init.lua
│   └── lua/
│       ├── config/           # 基础设置、键位、自动命令
│       └── plugins/          # 16 个插件独立配置
├── kitty/                    # Kitty 终端模拟器
├── picom/                    # Picom 合成器 (GLX + 模糊)
├── dunst/                    # Dunst 通知守护进程
├── lazygit/                  # LazyGit 终端 Git 客户端
├── yazi/                     # Yazi 终端文件管理器
├── shell_config/
│   ├── bash/.bashrc          # Bash 配置 (vi 模式)
│   └── fish/                 # Fish 配置 (vi 键位, 自动 startx)
├── X_configs/
│   ├── .xinitrc              # X11 会话启动 (dwm, picom, dunst, fcitx5)
│   └── .Xresources           # X 资源 (DPI 192, JetBrains Mono 17px)
├── scripts/
│   ├── dwm_status.sh         # DWM 状态栏 (网络/电池/音量/电源/时间)
│   └── wifi_fucking_rescan.sh
├── gdb/                      # GDB 调试配置 (项目专用)
├── vim_config_bak/           # 旧版 Vim 配置 (已被 Neovim 取代)
├── my_code_template/cmake/   # C++17 CMake 项目模板 (clang-tidy/clangd)
└── nix-config/               # Nix flake 可复现环境
```

## 🚀 快速部署

```bash
# 1. 克隆仓库
git clone https://github.com/shyweeds/dots-dwm.git ~/dotfiles-dwm

# 2. 预览将要执行的操作
cd ~/dotfiles-dwm
./deploy.sh -n

# 3. 确认无误后正式部署
./deploy.sh
```

部署脚本通过**软链接**将仓库中的配置文件映射到 `~/.config/` 和 `$HOME` 下。

> **幂等** — 已链接的配置自动跳过，可反复执行。
> <br>**安全** — 目标路径已有文件时跳过不覆盖，需手动处理冲突。

---

## 📦 依赖

### 核心软件

| 软件 | 用途 |
|------|------|
| [dwm](https://dwm.suckless.org) | 动态窗口管理器 |
| [picom](https://github.com/yshui/picom) | X11 合成器 (阴影、模糊、透明) |
| [dunst](https://dunst-project.org) | 通知守护进程 |
| [kitty](https://sw.kovidgoyal.net/kitty/) | GPU 加速终端模拟器 |
| [fish](https://fishshell.com) / bash | Shell |
| [neovim](https://neovim.io) `>= 0.10` | 编辑器 |
| [fcitx5](https://fcitx-im.org) | 输入法框架 |
| [feh](https://feh.finalrewind.org) | 壁纸设置 |
| [lazygit](https://github.com/jesseduffield/lazygit) | 终端 Git UI |
| [yazi](https://yazi-rs.github.io) | 终端文件管理器 |

### Neovim 插件概览

`<leader>` = `Space`

| 插件 | 功能 |
|------|------|
| [blink.cmp](https://github.com/Saghen/blink.cmp) | 自动补全 |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP 服务配置 |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | 自动格式化 |
| [nvim-lint](https://github.com/mfussenegger/nvim-lint) | 异步 Lint |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | 语法高亮 |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | 模糊查找 |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | 文件树 |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | 状态栏 |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git 行内标记 |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | 键位提示 |
| [flash.nvim](https://github.com/folke/flash.nvim) | 快速跳转 |
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | 配色主题 |
| [copilot.lua](https://github.com/zbirenbaum/copilot.lua) | GitHub Copilot |

### 字体

- [JetBrainsMono Nerd Font](https://github.com/ryanoasis/nerd-fonts) — 终端 & 状态栏图标

### Arch Linux 一键安装

```bash
sudo pacman -S --needed \
  dwm picom dunst kitty fish neovim \
  fcitx5 fcitx5-chinese-addons feh \
  lazygit yazi xorg-xrandr xorg-xrdb

yay -S nerd-fonts-jetbrains-mono  # 或手动下载
```

---

## ✨ 特性

### DWM 桌面环境

- **GLX 合成器** — Picom 配置双 Kawase 模糊、窗口阴影、透明度渐变
- **自定义状态栏** — 实时显示网络状态、电池电量、音量、电源模式、时间
- **自动启动** — `.xinitrc` 一键拉起 fcitx5、picom、dunst、壁纸、状态栏
- **Rust 镜像加速** — Shell 中已配置清华 TUNA 镜像

### Neovim 编辑器

- `Space` 作为 Leader 键，`which-key` 实时提示
- LSP 开箱支持：`clangd`, `pyright`, `rust-analyzer`, `lua_ls`
- 保存时自动格式化、异步 Lint
- Telescope 模糊查找、Flash 快速跳转
- Tokyonight 主题

### 终端体验

- Kitty 终端 — JetBrainsMono 16px，光标拖尾效果，pywal16 配色
- Fish Shell — vi 键位绑定，tty1 自动启动 X11
- Yazi 文件管理器 — 显示隐藏文件，<kbd>y</kbd> 命令自动跳转目录
- LazyGit — 禁用自动 fetch，避免网络抖动

---

## 📸 截图

<!-- TODO: 添加桌面截图 -->
<p align="center">
  <em>截图即将到来...</em>
</p>

---

## ⚙️ 手动调整

部署后你可能需要根据实际环境修改以下内容：

| 文件 | 需要调整 |
|------|----------|
| `~/.xinitrc` | 屏幕分辨率 (`xrandr --output eDP --mode`)、壁纸路径、fcitx5 输入法 |
| `~/.Xresources` | DPI 值 (当前 `192` 适用于 2K 高分屏) |
| `~/.config/fish/config.fish` | Cargo 路径、Comate 路径等机器相关配置 |
| `~/.local/bin/dwm_status.sh` | 电池路径 (`/sys/class/power_supply/BAT0`) |

<br>
<p align="center">
  <sub>Made with grit by shyweeds</sub>
</p>
