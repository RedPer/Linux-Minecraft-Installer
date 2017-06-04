#!/bin/bash
# Minecraft installer for Debian Based Linux Distributions
# and Gnome Based Deskop Enviroments
# v. 0.1
# by RedPer

help() {
	echo "Usage: $0 <option>"
	echo
	echo "Options:"
	echo "-s, --system        : Installs Minecraft for all users on this computer"
	echo "-u, --user          : Installs Minecraft only for current user"
	echo
	echo "-h, --help          : Shows this help screen"
	echo
}

# Installs Minecraft for all users on this computer
systemInstall() {
	echo "Installing Minecraft for all users on this computer"
	cd /usr/bin
	echo "Downloading Minecraft"
	wget http://s3.amazonaws.com/Minecraft.Download/launcher/Minecraft.jar
	echo "Downloading run script"
	wget https://github.com/RedPer/Linux-Minecraft-Installer/raw/master/InstallerFiles/minecraft-system
	mv ./minecraft-system ./minecraft
	chmod +x ./minecraft
	echo "Downloading desktop file (Adds Minecraft to Gnome)"
	cd /usr/share/applications
	wget https://github.com/RedPer/Linux-Minecraft-Installer/raw/master/InstallerFiles/minecraft-system.desktop
	mv ./minecraft-system.desktop ./minecraft.desktop

}

# Installs Minecraft only for current user
userInstall() {
	echo "Installing Minecraft only for current user \"${USER}\""
	cd ~
	mkdir Minecraft
	cd ./Minecraft
        echo "Downloading Minecraft"
        wget http://s3.amazonaws.com/Minecraft.Download/launcher/Minecraft.jar
        echo "Downloading run script"
        wget https://github.com/RedPer/Linux-Minecraft-Installer/raw/master/InstallerFiles/minecraft-user
	mv ./minecraft-user ./minecraft
	chmod +x ./minecraft
        echo "Downloading desktop file (Adds Minecraft to Gnome)"
        cd ~/.local/share/applications
        wget https://github.com/RedPer/Linux-Minecraft-Installer/raw/master/InstallerFiles/minecraft-user.desktop
	mv ./minecraft-user.desktop ./minecraft.desktop

}

# Checking if user provided 1 argument
if [ $# != 1 ]; then
	help
	exit 1
fi


# Choosing action based on arguments
if [ $1 = '-s' ]; then
	systemInstall

elif [ $1 = '--system' ]; then
	systemInstall

elif [ $1 = '-u' ]; then
	userInstall

elif [ $1 = '--user' ]; then
	userInstall

elif [ $1 = '-h' ]; then
	help

elif [ $1 = '--help' ]; then
	help

else
	echo "Unknown option \"$1\""
	help
fi
