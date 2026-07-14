#!/bin/bash
source ~/.cache/wal/colors.sh
WALLPAPER=$(cat ~/.cache/wal/wal)

cat > ~/.config/rofi/theme.rasi << THEME
* {
    main-bg:    ${background}AA;
    main-fg:    ${foreground}FF;
    main-br:    ${color1}66;
    select-bg:  ${color1}99;
    select-fg:  ${foreground}FF;
}
window {
    background-color: @main-bg;
    border:           1px solid;
    border-color:     @main-br;
    border-radius:    16px;
    width:            700px;
    height:           400px;
}
mainbox {
    background-color: transparent;
    children:         [ "imagebox", "rightbox" ];
    orientation:      horizontal;
    spacing:          0px;
    padding:          0px;
}
imagebox {
    background-image: url("$WALLPAPER", height);
    background-color: transparent;
    width:            300px;
    border-radius:    16px 0px 0px 16px;
}
rightbox {
    background-color: transparent;
    children:         [ "inputbar", "listview" ];
    spacing:          10px;
    padding:          10px;
    width:            400px;
}
inputbar {
    background-color: ${color0}AA;
    border-radius:    8px;
    padding:          10px;
    children:         [ "prompt", "entry" ];
    border:           1px solid;
    border-color:     ${color1}88;
}
prompt {
    background-color: transparent;
    text-color:       ${color1};
    padding:          0px 8px 0px 0px;
}
entry {
    background-color: transparent;
    text-color:       ${foreground};
    placeholder:      "Rechercher...";
    placeholder-color: ${foreground}88;
}
listview {
    background-color: transparent;
    columns:          1;
    lines:            5;
    spacing:          4px;
    scrollbar:        false;
}
element {
    background-color: transparent;
    border-radius:    8px;
    padding:          8px 12px;
    orientation:      horizontal;
    spacing:          10px;
    cursor:           pointer;
}
element selected {
    background-color: @select-bg;
}
element-icon {
    background-color: transparent;
    size:             32px;
    vertical-align:   0.5;
}
element-text {
    background-color: transparent;
    text-color:       @main-fg;
    vertical-align:   0.5;
    horizontal-align: 0.0;
}
THEME
