#!/bin/bash

# ** NOTES:
#   ** This script is made for Ubuntu x86_64 machines. !! --
#   ** You will manually need to change the script to adapt it to other distros or architectures.

# Source initalizer script
. ./init.sh 

# ----- Begin actual script -----
echo -e "
+---------------------------------------+
|${yellow}${bold}Using${green} apt${yellow} to install dependancies...${reset}   |
+---------------------------------------+"
echo -e "${red}${bold}This may take awhile...${reset}"
sleep 0.5

# ---- Update apt repositories and then upgrade local packages ----
sudo apt update &> /dev/null && sudo apt upgrade -y &> /dev/null &&
echo -e "${green}--- Done. ---${reset}"


# ---- Install dependancies ---- 
echo -e "\
+----------------------------+
|${yellow}${bold}Installing dependancies...${reset}  |
| ${blue}Depenancy list: ${reset}           |
|  ${blue}docker ${reset}                   |   
|  ${blue}cockpit ${reset}                  |
|  ${blue}zsh ${reset}                      |
|  ${blue}starship ${reset}                 |
+----------------------------+
" 
sleep 2
# -- Docker --
# Remove old docker versions
echo -e "\
+-------------------------------------+
|${red}${bold}Removing old Docker versions (if any)${reset}|
+-------------------------------------+" 
sleep 1
sudo apt-get remove -y docker dockerngine docker.io containerd runc &> /dev/null 
# Installing Docker
echo -e "\
+---------------------+
|${green}${bold}Installing Docker... ${reset}|
+---------------------+" 
sleep 0.5

sudo apt install ca-certificates curl gnupg lsb-release 

sudo mkdir -p /etc/apt/keyrings &> /dev/null

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo -e \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update && \
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin &> /dev/null

# Add user to docker group
sudo groupadd docker &> /dev/null
sudo usermod -aG docker $USER &> /dev/null && \
echo -e "\
+--------------------------------------+
|${green}${bold}Installed Docker! ${reset}                    |
|${green}${bold}Added user to docker group! ${reset}          |
|                                       |
|${yellowbg}You should exit and log back in again ${reset}|
|${yellowbg}for the group change to take effect.${reset}  |
+--------------------------------------+"
sleep 2

# -- Install cockpit --
echo -e "\
+----------------------+
|${yellow}${bold}Installing Cockpit... ${reset}|
+----------------------+"
sleep 1
. /etc/os-release
sudo apt install -y -t ${VERSION_CODENAME}-backports cockpit &> /dev/null


# -- Install shell tools --
echo -e "\
+--------------------------+
|${yellow}${bold}Installing shell tools... ${reset}|
+--------------------------+
"
sudo apt install -y git zsh vim &> /dev/null
curl -sS https://starship.rs/install.sh | sh

# - Dotfiles -
mkdir {tmp,~/.config} &> /dev/null
wget -P tmp https://raw.githubusercontent.com/michaelScopic/dotfiles/main/zsh/init.sh 
wget -P tmp https://raw.githubusercontent.com/michaelScopic/dotfiles/main/zsh/pluginInstall.sh 
wget -P tmp https://raw.githubusercontent.com/michaelScopic/dotfiles/main/zsh/zshrc 
wget -P tmp https://raw.githubusercontent.com/michaelScopic/dotfiles/main/config/starship/plain-text-symbols.toml 

cp -v tmp/plain-text-symbols.toml ~/.config/starship.toml 
echo -e "${redbg} You will need to manually change your shell to /bin/zsh...${reset}" 
echo -e "${cyan}${bold}-----------------------------------------${reset}" ; sleep 2
cd tmp
chmod +x ./pluginInstall.sh
echo -e "${red}Type ${reset}exit${red} after the next script is finished!${reset}" ; sleep 3
bash -c "./pluginInstall.sh" 





# Finish setup
cd $currentDir
rm -rf tmp

echo -e "
###################
#${green}Done with setup! ${reset}#
#    ${red}Exiting...${reset}   #
###################"

exit 0