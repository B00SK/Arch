#!/bin/bash
source ~/.cache/wal/colors.sh

cat > ~/.config/swayosd/style.css << EOF
window {
    border-radius: 999px;
    padding: 0px 20px;
    background: ${background}BB;
    border: 1px solid ${color1}88;
    min-height: 0px;
}
box { 
    min-width: 350px; 
    min-height: 0px;
    margin: 0px;
}
image { 
    -gtk-icon-size: 8px; 
    margin-right: 4px;
    min-height: 0px;
}
progressbar trough {
    border-radius: 999px;
    background: ${foreground}33;
    min-height: 3px;
}
progressbar progress {
    border-radius: 999px;
    background: ${color1};
    min-height: 3px;
}
EOF
