#!/usr/bin/env sh
# !! NOTES:
#   -- !! This script is made for Debian-based x86_64 machines. !! --
#
#       You will manually need to change the script to adapt it to other
#       distros or architectures.

echo "\e[31m -- Initalizing script... -- \e[0m" && sleep 0.2
# - -gives me an excuse to get info of distro and shell idk
echo ""
# --- Print out basic info ---
echo "\e[35m---------- Basic info ----------\e[0m"
# Print the distro 
echo   "\e[32mDistro: \e[0m$(lsb_release -d | cut -f 2- )"
# Print kernel version
echo "\e[33mKernel: \e[0m$(uname -r) $(uname -o)" 
# Print shell 
echo "\e[34mShell: $SHELL \e[0m"
# Print hostname
echo "\e[35mHostname: \e[0m$(cat /etc/hostname)"
# Print current user (is user root?)
echo "\e[36mUser: \e[0m$(whoami)"
echo "\e[35m--------------------------------\e[0m"
sleep 1
