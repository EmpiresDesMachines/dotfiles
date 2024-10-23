xrandr --output HDMI-0 --mode 1920x1080 --rate 75.00
xinput set-prop "12" "libinput Accel Profile Enabled" 0 1 0
sxhkd &
exec bspwm
