#!/bin/env bash

echo "This automated setup utility will install software and"
echo "copy relevant config files for your system."
echo "Select software category:"
echo "1)Essentials    2)Dev Tools    3)Gaming    4)Misc"
read CHOICE

case $CHOICE in
	1)
		sudo pacman -S kitty thunderbird neovim p7zip timeshift nvidia-prime
		yay -S brave-bin
		cp -r .fonts/* $HOME/.local/share/fonts/*
		cp .bashrc $HOME/.bashrc
		mkdir $HOME/.config/kitty
		mkdir $HOME/.config/nvim
		cp -r .config/kitty/* $HOME/.config/kitty/*
		cp -r .config/nvim/* $HOME/.config/nvim/*
		;;
	2)
		sudo pacman -S github-cli
		yay -S vscodium-bin
		;;
	3)
		sudo pacman -S steam discord
		yay -S proton-ge-custom-bin
		;;
	4)
		sudo pacman -S ncdu trash-cli lolcat
		;;
esac
