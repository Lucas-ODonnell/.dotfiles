#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch top and bottom bar
polybar top --config=/home/lucas/.config/polybar/config.ini &
polybar bottom --config=/home/lucas/.config/polybar/config.ini
