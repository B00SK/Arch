#!/bin/bash
DOTFILES=~/dotfiles

# Images
cp -r ~/Images $DOTFILES/Pictures/

# Tout le dossier .config
cp -r ~/.config/hypr $DOTFILES/config/
cp -r ~/.config/waybar $DOTFILES/config/
cp -r ~/.config/kitty $DOTFILES/config/
cp -r ~/.config/rofi $DOTFILES/config/
cp -r ~/.config/dunst $DOTFILES/config/
cp -r ~/.config/fastfetch $DOTFILES/config/
cp -r ~/.config/btop $DOTFILES/config/
cp -r ~/.config/cava $DOTFILES/config/
cp -r ~/.config/swayosd $DOTFILES/config/
cp -r ~/.config/wlogout $DOTFILES/config/
cp -r ~/.config/eww $DOTFILES/config/

# Shell et scripts
cp ~/.zshrc $DOTFILES/
cp ~/dotfiles/scripts/*.sh $DOTFILES/scripts/

# Apps installées
pacman -Qe > $DOTFILES/packages-official.txt
pacman -Qm > $DOTFILES/packages-aur.txt

# Système
mkdir -p $DOTFILES/system
sudo cp /etc/modprobe.d/mt7921e.conf $DOTFILES/system/
sudo cp /etc/environment $DOTFILES/system/

# Push
cd $DOTFILES
git add .
git commit -m "backup $(date '+%Y-%m-%d %H:%M')"
git push

echo "✅ Backup terminé !"
