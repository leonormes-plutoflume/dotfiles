<<<<<<< HEAD
#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar

for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload topbar > /dev/null 2> ~/.config/polybar/topbar-$m.log & 
done
=======
#!/bin/env sh

pkill polybar

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload i3wmthemer_bar &
  done
else
  polybar --reload i3wmthemer_bar &
fi
>>>>>>> d40ae02987599577fd2ff0c9a7e37573be4b3426
