# 声明显示会话
export DISPLAY=:0
export XAUTHORITY=$HOME/.Xauthority
export XDG_CURRENT_DESKTOP=dwm
export XDG_SESSION_DESKTOP=dwm
export XDG_SESSION_TYPE=x11


# 把显示相关变量存入 systemd 用户环境
systemctl --user import-environment DISPLAY XAUTHORITY XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP XDG_SESSION_TYPE

# 更新 systemd D-Bus 总线的激活环境
dbus-update-activation-environment --systemd DISPLAY XAUTHORITY XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP XDG_SESSION_TYPE

xrdb -merge ~/.Xresources
xrandr --output eDP --mode 2560x1600

# start sth.
pgrep -x fcitx5 > /dev/null || fcitx5 -d
pgrep -x picom > /dev/null || picom -b
pgrep -x dunst > /dev/null || dunst &
feh --no-fehbg --bg-fill '/home/shyweeds/dwm/wallpaper/1.png'
# my_status_bar in a shell
killall -q dwm_status.sh
/home/shyweeds/dotfiles-dwm/scripts/dwm_status.sh &

exec dwm
