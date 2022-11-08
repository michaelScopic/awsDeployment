# awsDeployment

Automated deployment for my AWS CSA machines using shell scripts.

## NOTES:
This is **heavily** WIP. Nothing is in a usable state as of now.

This repo was made for Ubuntu x86_64 based machines!!!

Considering learning/using Ansible for this (?)


## Installation (WIP)

Prerequisites:
```sh
sudo apt install lsb-release tput bash zsh curl wget git 
```

Clone this repo to the machine you want to deploy on:

```sh
git clone https://github.com/michaelScopic/awsDeployment.git
```

Then cd into the repo:

```sh
cd awsDeployment
```

Now lets set everything up with `setup.sh`:

```sh
./setup.sh
```

* Note: If you can't run `setup.sh`, make it executable with `chmod +x setup.sh` and then run the script again.

**WIP**
