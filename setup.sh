#!/usr/bin/env bash
# !! NOTES:
#   -- !! This script is made for Ubuntu x86_64 machines. !! --
#
#       You will manually need to change the script to adapt it to other
#       distros or architectures.

echo -e "
+----------------------------------------+
| \e[32mUsing '\e[33mapt\e[32m' to install dependancies...\e[0m |
+----------------------------------------+"
sleep 0.5

# ---- Update apt repositories and then upgrade local packages ----
sudo apt update && \
sudo apt upgrade -y && \
echo -e "\e[33m --- Note: updated/upgraded packages... --- \e[0m"


# ---- Install dependancies ---- 
echo -e "
+-----------------------------+
| \e[33mInstalling dependancies...\e[0m  |
| \e[32m Depenancy list: \e[0m           |
|  \e[32m docker \e[0m                   |   
|  \e[32m cockpit \e[0m                  |
|  \e[32m git \e[0m                      |
|  \e[32m zsh \e[0m                      |
+-----------------------------+
" 
sleep 2
# -- Docker --
# Remove old docker versions
echo -e "
+---------------------------------------+
| \e[31mRemoving old Docker versions (if any)\e[0m |
+---------------------------------------+" 
sleep 1
#sudo apt-get remove docker docker-engine docker.io containerd runc
# Installing Docker
echo -e "
+----------------------+
| \e[33mInstalling Docker... \e[0m|
+----------------------+" 
sleep 0.5

#sudo apt-get install \
#    ca-certificates \
#    curl \
#    gnupg \
#    lsb-release

#sudo mkdir -p /etc/apt/keyrings

#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

#echo \
#  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
#  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

#sudo apt-get update && \
#sudo apt-get install \
#    docker-ce \ 
#    docker-ce-cli \
#    containerd.io \ 
#    docker-compose-plugin

# Add user to docker group
#sudo groupadd docker
#sudo usermod -aG docker $USER && \
echo -e "
+---------------------------------------+
| \e[32mInstalled Docker!\e[0m                     |
| \e[32mAdded user to docker group! \e[0m          |
|                                       |
| \e[33mYou should exit and log back in again \e[0m|
| \e[33mfor the group change to take effect.\e[0m  |
+---------------------------------------+"
sleep 2

# -- Install cockpit --
. /etc/os-release
sudo apt install -t ${VERSION_CODENAME}-backports cockpit 


# -- Install shell tools --
sudo apt install -y \
    git \
    zsh \
    vim \
    duf \ # cleaner alternative to 'df'
    neofetch 

# install starship with snap
sudo snap install starship
mkdir ~/.config

# clone my dotfiles
git clone https://github.com/michaelScopic/dotfiles ~
cd ~/dotfiles/config/starship
cp -v plain-text-symbols.toml ~/.config/starship.toml


