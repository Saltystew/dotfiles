#!/usr/bin/env sh

# Terminate already running bar instances
killall -q compton

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
compton -b --config /home/hunter/.config/compton/compton.conf


echo "Compton launched..."
