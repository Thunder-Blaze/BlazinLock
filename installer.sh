#!/bin/bash

HYPR_DIR="$HOME/.config/hypr"
BINARY_DIR="/usr/bin"

if [[ -s "/usr/bin/figlet" ]]; then
	figlet BlazinLock
else
	echo "BlazinLock"
fi

echo ""

if [[ -f "$HYPR_DIR/hyprlock.conf" ]]; then
	echo "Found Existing Hyprlock Config File,"
	read -p "Do you want to backup your old hyprlock config (Y/n) ? " confbackup
	if [[  $confbackup == "n" || $confbackup == "N" ]]; then
		rm -f "$HYPR_DIR/hyprlock.conf"
	else
		if [[ -f "$HYPR_DIR/hyprlock.conf.backup" ]]; then
			rm -f "$HYPR_DIR/hyprlock.conf.backup"
		fi
	    mv "$HYPR_DIR/hyprlock.conf" "$HYPR_DIR/hyprlock.conf.backup"
	    echo "Backed Up Successfully"
	fi
fi

if [[ -d "$HYPR_DIR/hyprlock" ]]; then
	echo "Found Existing Hyprlock Folder,"
	read -p "Do you want to backup your old hyprlock config (Y/n) ? " folderbackup
	if [[  $folderbackup == "n" || $folderbackup == "N" ]]; then
		rm -r "$HYPR_DIR/hyprlock"
	else
		if [[ -d "$HYPR_DIR/hyprlock.backup" ]]; then
			rm -r "$HYPR_DIR/hyprlock.backup"
		fi
	    mv "$HYPR_DIR/hyprlock" "$HYPR_DIR/hyprlock.backup"
	    echo "Backed Up Successfully"
	fi
fi

chmod +x "hyprlock/blazinscripts.sh"
chmod +x blazinlock
cp -r hyprlock "$HYPR_DIR/"
sudo cp -f blazinlock "$BINARY_DIR/"

echo "Installation Complete"
echo ""
echo "Hyprlock Types"
echo "  1) Hyprdots (waybar) Integration Screenshot"
echo "  2) Hyprdots (waybar) Integration Wallpaper"
echo "  3) End 4 Dots (ags) Integration Screenshot"
echo "  4) End 4 Dots (ags) Integration Wallpaper"
echo "  5) Screenshot Type Hyprlock"
echo "  6) User Image Type Hyprlock (Not Available as Default)"
read -p "Choose Your Default Hyprlock Type - " USER_CHOICE

while [[ $USER_CHOICE -lt 1 || $USER_CHOICE -gt 5 ]]; do
	read -p "Choose Correct Type - " USER_CHOICE
done

COMM=""

if [[ $USER_CHOICE -eq 1 ]]; then
	COMM="blazinlock -hs"
elif [[ $USER_CHOICE -eq 2 ]]; then
	COMM="blazinlock -hw"
elif [[ $USER_CHOICE -eq 3 ]]; then
	COMM="blazinlock -es"
elif [[ $USER_CHOICE -eq 4 ]]; then
	COMM="blazinlock -ew"
elif [[ $USER_CHOICE -eq 5 ]]; then
	COMM="blazinlock -s"
fi

COMM="bind = \$mainMod, L, exec, $COMM # launch lock screen"

read -p "Do you want to Update your Keybind for Blazinlock as Win + L (Y/n) ?" updtkeybind
if ! [[ $updtkeybind == "n" || $updtkeybind == "N" ]]; then
	sed -i "/exec, hyprlock/d" "$HYPR_DIR/hyprland.conf" 2>/dev/null
	echo "$COMM" >> "$HYPR_DIR/hyprland.conf"
	echo "An exec line Successfully added for BlazinLock in hyprland.conf"
fi

echo "Default Hyprlock Type Set Successfully"
echo "After Relogin Press Super Key (Windows) + L to Launch Lockscreen"
