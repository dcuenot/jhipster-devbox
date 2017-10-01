#!/usr/bin/env bash

# Modified version of this gist: https://gist.github.com/Adron/90863e51c8c5c0ad2049890bcd8abbfb 

# Get URLs for most recent versions
terraform_url=$(curl --silent https://releases.hashicorp.com/index.json | jq '{terraform}' | egrep "linux.*64" | sort -rh | head -1 | awk -F[\"] '{print $4}')
packer_url=$(curl --silent https://releases.hashicorp.com/index.json | jq '{packer}' | egrep "linux.*64" | sort -rh | head -1 | awk -F[\"] '{print $4}')

# Create a move into directory.
cd /tmp
#mkdir packer

# Download Terraform. URI: https://www.terraform.io/downloads.html
echo Terraform... : $terraform_url
curl -o terraform.zip $terraform_url
# Unzip and install
unzip terraform.zip
rm terraform.zip

sudo mv terraform /usr/bin

# Change directory to Packer
#cd ~/packer

# Download Packer. URI: https://www.packer.io/downloads.html
#curl -o packer.zip $packer_url
# Unzip and install
#unzip packer.zip

#echo '
# Terraform & Packer Paths.
#export PATH=~/terraform/:$PATH
#' >>~/.bash_profile

#source ~/.bash_profile
