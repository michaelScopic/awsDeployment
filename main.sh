#!/usr/bin/env sh

echo "\e[31m -- Initalizing script... -- \e[0m" && sleep 0.2
# - -gives me an excuse to get info of distro and shell idk

# --- Print out basic info ---
# Print the distro 
echo "\e[32mDistro: \e[0m$(lsb_release -d | awk '{print $2}' )"
# Print kernel version
echo "\e[33mKernel: \e[0m$(uname -r)" 
# Show shell 
echo "\e[34mShell: \e[0m$SHELL" 
echo "\e[35m--------------------------------\e[0m"
sleep 1
