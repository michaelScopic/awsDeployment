#!/usr/bin/env sh
# Initalizer script

echo " 
+-----------------------+
| Initalizing script... |
+-----------------------+ "
sleep 1

currentDir=$(pwd)
echo "Current directory: $currentDir"
echo ""

# -- Set colors --
echo " --- Setting colors... ---"
reset='\e[0m' && echo "$reset Normal text"
red='\e[31m' && echo "$red Red $reset"
green='\e[32m' && echo "$green Green $reset"
yellow='\e[33m' && echo "$yellow Yellow $reset"
blue='\e[34m' && echo "$blue Blue $reset"
purple='\e[35m' && echo "$purple Purple $reset"
cyan='\e[36m' && echo "$cyan Cyan $reset"
echo ""
redbg='\e[41m' && echo "$redbg Red background $reset"
greenbg='\e[42m' && echo "$greenbg Green background $reset"
yellowbg='\e[43m' && echo "$yellowbg Yellow background $reset"
bluebg='\e[44m' && echo "$bluebg Blue background $reset"
purplebg='\e[45m' && echo "$purplebg Purple background $reset"
cyanbg='\e[46m' && echo "$cyanbg Cyan background $reset"
echo "
+-----------------------+
| $green Done setting colors! $reset|
+-----------------------+"

sleep 1
echo ""

# --- Print out basic info ---
echo "---------- Basic info ----------"
# Print the distro 
echo   "$green Distro:$reset $(lsb_release -d | cut -f 2- )"
# Print kernel version
echo "$yellow Kernel:$reset $(uname -r) $(uname -o)" 
# Print shell 
echo "$blue Shell:$reset $SHELL"
# Print hostname
echo "$purple Hostname:$reset $(cat /etc/hostname)"
# Print current user (is user root?)
echo "$cyan User:$reset $(whoami)"
echo "--------------------------------"

echo "
######################################
#$green        Done initalizing! $reset          #
#$red Continuing with original script...$reset #
######################################"

sleep 2.5