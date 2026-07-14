#!/bin/bash
wal -i "$1"
source ~/.cache/wal/colors.sh

# Convertir hex en rgba pour wlogout
hex_to_rgba() {
    local hex=${1#"#"}
    local alpha=$2
    printf "rgba(%d, %d, %d, %s)" 0x${hex:0:2} 0x${hex:2:2} 0x${hex:4:2} $alpha
}
BG=$(hex_to_rgba $background 0.8)
BTN=$(hex_to_rgba $background 0.67)
BORDER=$(hex_to_rgba $color1 0.4)
HOVER=$(hex_to_rgba $color1 0.53)
FG=$foreground
ACCENT=$color1

# Recolore icônes wlogout en blanc
mkdir -p ~/.config/wlogout/icons
for icon in lock logout shutdown reboot; do
    magick /usr/share/wlogout/icons/${icon}.png \
        -colorspace gray -fill white -colorize 100 \
        ~/.config/wlogout/icons/${icon}.png
done

cat > ~/.config/wlogout/style.css << WLOGOUT
* {
    background-image: none;
    box-shadow: none;
}
window {
    background-color: $BG;
}
button {
    background-color: $BTN;
    border: 1px solid $BORDER;
    border-radius: 12px;
    color: $FG;
    font-family: "JetBrainsMono Nerd Font";
    font-size: 14px;
    margin: 10px;
    padding-top: 80px;
    background-repeat: no-repeat;
    background-position: center 20%;
    background-size: 25%;
}
button:hover {
    background-color: $HOVER;
    border-color: $ACCENT;
}
#lock { background-image: image(url("/home/kyyneda/.config/wlogout/icons/lock.png")); }
#logout { background-image: image(url("/home/kyyneda/.config/wlogout/icons/logout.png")); }
#shutdown { background-image: image(url("/home/kyyneda/.config/wlogout/icons/shutdown.png")); }
#reboot { background-image: image(url("/home/kyyneda/.config/wlogout/icons/reboot.png")); }
WLOGOUT

cat > ~/.config/cava/config << CAVA
[color]
gradient = 1
gradient_count = 8
gradient_color_1 = '${color1}'
gradient_color_2 = '${color2}'
gradient_color_3 = '${color3}'
gradient_color_4 = '${color4}'
gradient_color_5 = '${color5}'
gradient_color_6 = '${color6}'
gradient_color_7 = '${color7}'
gradient_color_8 = '${color8}'
CAVA

EWW_BG=$(hex_to_rgba $background 0.9)
EWW_BORDER=$(hex_to_rgba $color1 0.3)
EWW_HOVER=$(hex_to_rgba $color1 0.3)

cat > ~/.config/eww/eww.scss << EWW
* {
    all: unset;
    font-family: "JetBrainsMono Nerd Font";
}
.music-widget {
    background-color: $EWW_BG;
    border-radius: 15px;
    padding: 15px;
    border: 1px solid $EWW_BORDER;
}
.album-art {
    border-radius: 10px;
    margin-bottom: 10px;
}
.music-title {
    color: $foreground;
    font-size: 14px;
    font-weight: bold;
}
.music-artist {
    color: $color8;
    font-size: 12px;
}
.ctrl-btn {
    color: $foreground;
    font-size: 18px;
    padding: 5px 10px;
    border-radius: 8px;
}
.ctrl-btn:hover {
    background-color: $EWW_HOVER;
}
EWW
eww reload 2>/dev/null

~/dotfiles/scripts/generate-dunst-theme.sh /dev/null 2>&1
~/dotfiles/scripts/generate-rofi-theme.sh /dev/null 2>&1
~/.config/swayosd/generate-style.sh /dev/null 2>&1


killall swaybg 2>/dev/null
swaybg -i "$1" -m fill > /dev/null 2>&1 &
disown

killall swayosd-server 2>/dev/null
swayosd-server --style ~/.config/swayosd/style.css > /dev/null 2>&1 &
disown

killall waybar 2>/dev/null
waybar > /dev/null 2>&1 &
disown

killall dunst 2>/dev/null
dunst > /dev/null 2>&1 &
disown

KEYBOARD_COLOR=${color1:1}
asusctl aura effect static -c "$KEYBOARD_COLOR" 2>/dev/null

fastfetch --logo /home/kyyneda/.config/fastfetch/assets/feitan_phone.jpg --logo-type kitty --logo-width 27 --logo-height 15
