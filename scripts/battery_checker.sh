#!/usr/bin/env bash
BAT=$(cat /sys/class/power_supply/BAT0/capacity)
STATUS=$(cat /sys/class/power_supply/BAT0/status)

[ "$STATUS" != "Discharging" ] && exit 0

if [ "$BAT" -le 20 ]; then
    dunstify -u normal "🔋 电量偏低" "当前电量：${BAT}%"
fi

# 适当时候删除/tmp/battery-hibernating
if [[ -f /tmp/battery-hibernating && "$BAT" -gt 10 ]]; then
  rm /tmp/battery-hibernating
fi
if [ "$BAT" -le 10 ]; then
  # 防止重复触发休眠
  if [[ -f /tmp/battery-hibernating ]]; then
      exit 0
  fi
  touch /tmp/battery-hibernating
  systemctl hibernate
fi
