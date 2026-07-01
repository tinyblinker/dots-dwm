#!/usr/bin/env bash
BAT_DEV="/sys/class/power_supply/BAT0"
BAT=$(< "$BAT_DEV/capacity")
STATUS=$(< "$BAT_DEV/status")

[ "$STATUS" != "Discharging" ] && exit 0

if [ "$BAT" -le 20 ]; then
    dunstify -u critical "🔋 电量偏低" "当前电量：${BAT}%"
fi

# 适当时候删除/tmp/battery-suspending
if [[ -f /tmp/battery-suspending && "$BAT" -gt 10 ]]; then
  rm /tmp/battery-suspending
fi
if [ "$BAT" -le 10 ]; then
  # 防止重复触发挂起
  if [[ -f /tmp/battery-suspending ]]; then
      exit 0
  fi
  touch /tmp/battery-suspending

  systemctl suspend
fi
