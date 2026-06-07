# 声明显示会话
export DISPLAY=:0
export XAUTHORITY=$HOME/.Xauthority
export XDG_CURRENT_DESKTOP=GTK
export XDG_SESSION_DESKTOP=GTK

# 把显示相关变量存入 systemd 用户环境
systemctl --user import-environment DISPLAY XAUTHORITY XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP
dbus-update-activation-environment --systemd DISPLAY XAUTHORITY XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP

xrdb -merge ~/.Xresources
xrandr --output eDP --mode 2560x1600

# start sth.
pgrep -x fcitx5 > /dev/null || fcitx5 &
pgrep -x picom > /dev/null || picom &
pgrep -x dunst > /dev/null || dunst &
feh --no-fehbg --bg-fill '/home/shyweeds/dwm/wallpaper/1.png' 
# my_status_bar in a shell
/home/shyweeds/dotfiles-dwm/scripts/dwm_status.sh &

exec dwm
