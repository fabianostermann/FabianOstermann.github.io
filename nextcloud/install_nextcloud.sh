#!/bin/bash

# this script only installs nextcloud
# useful for initial setup to obtain the folder ~/Nextcloud/system

info="echo -e \n :::: "

function apt_install(){
    sudo apt -y install "$@"
    if [ $? != 0 ]; then
        echo FAILURE: Unable to install "$@" via apt.
    fi
}

$info "install nextcloud client from dev-ppa"
sudo add-apt-repository -y ppa:nextcloud-devs/client
sudo apt update
apt_install nextcloud-desktop nextcloud-desktop-cmd
apt_install python3-nautilus # enables python plugins for nautilus
apt_install nautilus-nextcloud # status symbols in nautilus

# workaround for bug in v3.16.3 und v3.16.4
mkdir -p ~/.config/Nextcloud/
touch ~/.config/Nextcloud/nextcloud.cfg
