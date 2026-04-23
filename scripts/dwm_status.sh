#!/bin/bash

# ----------- config -----------
BAT_PATH="/sys/class/power_supply/BAT0"

# ----------- modules -----------

get_net() {
    # fallback:check if there is networks 
    if ping -c 1 -W 1 1.1.1.1 >/dev/null; then
        printf " on"
    else
        printf " off"
    fi
}

get_volume() {
    if command -v pactl >/dev/null 2>&1; then
      VOL=$(pactl get-sink-volume "$(pactl get-default-sink)" | grep -o '[0-9]\+%' | head -n1)
      printf "[V]%s" "$VOL"
    fi
}

get_battery() {
    [ -d "$BAT_PATH" ] || return

    CAP=$(cat "$BAT_PATH/capacity" 2>/dev/null)
    STATUS=$(cat "$BAT_PATH/status" 2>/dev/null)

    case "$STATUS" in
        Charging) ICON="[CHG]" ;;
        Discharging) ICON="[DIS]" ;;
        Full) ICON="[FUL]" ;;
        *) ICON="?" ;;
    esac

    printf "%s%s%%" "$ICON" "$CAP"
}

get_time() {
    date '+ %H:%M'
}

get_power_profile() {
    if command -v powerprofilesctl >/dev/null 2>&1; then
        PROFILE=$(powerprofilesctl get 2>/dev/null)

        case "$PROFILE" in
            performance) printf " perf" ;;
            balanced) printf " bal" ;;
            power-saver) printf " save" ;;
            *) printf "%s" "$PROFILE" ;;
        esac
    fi
}

# ----------- main loop -----------
TIME_FLAG=1

NET=$(get_net)
BAT=$(get_battery)
PWR=$(get_power_profile)
TIME=$(get_time)
VOL=$(get_volume)

sleep 3

while true; do
    if [ $((TIME_FLAG)) -eq 11 ] ; then
      TIME_FLAG=1
    fi
    if [ $((TIME_FLAG % 10)) -eq 0 ] ; then
      NET=$(get_net)
    fi 
    if [ $((TIME_FLAG % 10)) -eq 0 ] ; then
      BAT=$(get_battery)
    fi
    if [ $((TIME_FLAG % 10)) -eq 0 ] ; then
      PWR=$(get_power_profile)
    fi
    if [ $((TIME_FLAG % 1)) -eq 0 ] ; then
      TIME=$(get_time)
      VOL=$(get_volume)
    fi
    
    TIME_FLAG=$((TIME_FLAG+1))

    STATUS="$NET|$BAT|$VOL|$PWR|$TIME"

    xsetroot -name "$STATUS"

    sleep 1 
done &
