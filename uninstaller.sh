#!/usr/bin/env bash

BINARY_PATH="/usr/bin/blazinlock"
CONFIG_PATH="$HOME/.config/hypr/hyprlock"
DATA_DIR="$HOME/.config/hypr/hyprlock"

if [[ -s $BINARY_PATH ]]; then
  read -p "Do you want to remove BlazinLock ? (Y/n) " userinput
  if ! [[ $userinput == "n" || $userinput == "N" ]]; then
    sudo rm $BINARY_PATH
    if [[ $? -eq 0 ]]; then
      echo "BlazinLock Binary Removed Succesfully"
    else
      echo "Failed To Remove BlazinLock Binary"
    fi
  fi
else
	echo "BlazinLock Binary Not Found"
fi

echo ""

if [[ -s $CONFIG_PATH ]]; then
  read -p "Do you want to remove Hyprlock Config made by BlazinLock ? (Y/n) " userinput
  if ! [[ $userinput == "n" || $userinput == "N" ]]; then
    rm $CONFIG_PATH
    if [[ $? -eq 0 ]]; then
      echo "Hyprlock Config Removed Succesfully"
    else
      echo "Failed To Remove Hyprlock Config"
    fi
  fi
else
	echo "BlazinLock Binary Not Found"
fi

echo ""


if [[ -d $DATA_DIR ]]; then
  read -p "Do you want to remove BlazinLock Data Directory (i.e. ~/.config/hypr/hyprlock/) ? (Y/n) " userinput
  if ! [[ $userinput == "n" || $userinput == "N" ]]; then
    rm -r $DATA_DIR
    if [[ $? -eq 0 ]]; then
      echo "BlazinLock Data Directory Removed Succesfully"
    else
      echo "Failed To Remove BlazinLock Data Directory"
    fi
  fi
else
	echo "BlazinLock Data Dir Not Found"
fi

echo ""

echo -e "To Remove Keybinds (if Installed), check the below files and manually remove or replace it with the lock of your choice\n"
grep -nr blazinlock ~/.config/hypr/
