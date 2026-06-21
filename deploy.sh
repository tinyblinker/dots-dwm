#!/usr/bin/env bash
# deploy.sh — 将本仓库配置文件软链接到 $HOME
# 用法: ./deploy.sh      直接部署
#       ./deploy.sh -n   预览，不实际修改
set -euo pipefail

D="$(cd "$(dirname "$0")" && pwd)"   # 仓库根目录
H="$HOME"                             # 用户家目录
DRY=false; [[ "${1:-}" == "-n" ]] && DRY=true

# 颜色 & 日志
GRN='\033[0;32m'; YLW='\033[1;33m'; CYN='\033[0;36m'; BLD='\033[1m'; RST='\033[0m'
ok()   { echo -e "  ${GRN}[OK]${RST} $*"; }
info() { echo -e "  ${CYN}[..]${RST} $*"; }

# link <源绝对路径> <目标绝对路径> [描述]
#   目标已是正确软链接 → 跳过（幂等）
#   目标不存在 → 新建软链接
#   目标已存在但非正确链接 → 跳过并警告（不覆盖，安全第一）
link() {
    local s="$1" d="$2" t="${3:-}"

    # 已是正确链接，跳过
    [[ -L "$d" && "$(readlink "$d")" == "$s" ]] && { ok "已链接: $d${t:+ ($t)}"; return 0; }

    # 目标已存在但不是我们的链接，不覆盖
    if [[ -e "$d" || -L "$d" ]]; then
        info "跳过(目标已存在): $d"
        return 0
    fi

    # 预览
    if "$DRY"; then
        info "将创建: $d${t:+ ($t)}"
        return 0
    fi

    # 创建父目录并链接
    mkdir -p "$(dirname "$d")"
    ln -s "$s" "$d"
    ok "已部署: $d${t:+ ($t)}"
}

echo -e "\n${BLD}dotfiles 部署${RST}  |  仓库: ${CYN}$D${RST}  |  目标: ${CYN}$H${RST}"
"$DRY" && echo -e "  ${YLW}[预览模式，不修改任何文件]${RST}"

# ============================================================
# 1. ~/.config/ 下的应用配置 —— 目录名一一对应
# ============================================================
echo -e "\n${BLD}── ~/.config/${RST}"
for item in nvim kitty picom dunst lazygit yazi; do
    link "$D/$item" "$H/.config/$item" "$item"
done

# ============================================================
# 2. Shell 配置 —— bash 和 fish
# ============================================================
echo -e "\n${BLD}── Shell${RST}"
link "$D/shell_config/bash/.bashrc"       "$H/.bashrc"                    "bash"
link "$D/shell_config/fish/config.fish"    "$H/.config/fish/config.fish"   "fish"
link "$D/shell_config/fish/completions"    "$H/.config/fish/completions"   "fish补全"
# fish_variables 包含机器相关路径，部署后会覆盖本地变量，按需手动链接

# ============================================================
# 3. X11 与 DWM 窗口管理器
# ============================================================
echo -e "\n${BLD}── X11 / DWM${RST}"
link "$D/X_configs/.xinitrc"    "$H/.xinitrc"    "xinitrc"
link "$D/X_configs/.Xresources" "$H/.Xresources" "Xresources"

# ============================================================
# 4. 自定义脚本 → ~/.local/bin/
# ============================================================
echo -e "\n${BLD}── ~/.local/bin/${RST}"
for f in "$D/scripts/"*; do
    [[ -f "$f" ]] || continue
    link "$f" "$H/.local/bin/$(basename "$f")"
done

# ============================================================
# 5. 可选配置 —— 旧版遗留与项目专用，注释掉不需要的即可
# ============================================================
echo -e "\n${BLD}── 可选${RST}"
link "$D/gdb/gdbinit_bak"        "$H/.gdbinit"        "gdb(项目专用)"
link "$D/vim_config_bak/.vimrc"   "$H/.vimrc"          "vim(旧)"
link "$D/my_code_template/cmake"  "$H/Templates/cmake"  "CMake模板"
# Nix 环境需手动执行: nix profile install '<仓库路径>/nix-config#'

echo -e "\n${BLD}完成。${RST}"
"$DRY" && echo -e "${YLW}(预览模式，未修改任何文件)${RST}"
