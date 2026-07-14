#!/bin/bash
source ~/.cache/wal/colors.sh

cat > ~/.config/dunst/dunstrc << DUNST
[global]
    monitor = 0
    follow = none
    width = 300
    height = (0, 100)
    origin = top-right
    offset = (10, 10)
    transparency = 15
    separator_height = 2
    padding = 10
    horizontal_padding = 10
    frame_width = 1
    frame_color = "#${color1:1}"
    corner_radius = 8
    font = JetBrainsMono Nerd Font 10
    format = "<b>%s</b>\n%b"
    mouse_left_click = close_current
    mouse_right_click = close_all

[urgency_low]
    background = "#${background:1}"
    foreground = "#${foreground:1}"
    timeout = 4

[urgency_normal]
    background = "#${background:1}"
    foreground = "#${foreground:1}"
    frame_color = "#${color1:1}"
    timeout = 6

[urgency_critical]
    background = "#${color1:1}"
    foreground = "#${foreground:1}"
    timeout = 0
DUNST
