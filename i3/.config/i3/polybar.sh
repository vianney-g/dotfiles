#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# # Wait for i3's IPC socket to be available
# i3_socket=$(i3 --get-socketpath 2>/dev/null)
# max_wait=10
# wait_count=0
# while [ ! -S "$i3_socket" ] && [ $wait_count -lt $max_wait ]; do
#     sleep 0.2
#     i3_socket=$(i3 --get-socketpath 2>/dev/null)
#     wait_count=$((wait_count + 1))
# done

# Launch polybar
polybar -c ~/.config/polybar/config.ini main &
