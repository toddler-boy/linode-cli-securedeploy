#!/bin/bash

# simple prompt-based script to help deploy via CLI

#These Variables will almost always stay the same
BYellow='\033[1;33m'
NC='\033[0m'

pub_key=$(cat $HOME/.ssh/id_rsa.pub)

JSON="{
    \"username\":\"${sudouser}\",
    \"password\":\"${sudopass}\",
    \"pubkey\":\"${pub_key}\",
    \"disable_root\":\"${dis_root}\"
    }"

#Clear your screen before you do anything
Clear

#Set your CLI parameters

    echo -e "${BYellow}What size plan should we deploy?: ${NC}"
    linode-cli linodes types --text --delimiter "," | awk -F"," '{print "\033[32m"$1" \t " $2" \033[0m";}' | head -7 | tail -n+2
    read plan
    
    echo -e  "${BYellow}Where do you want to deploy this Linode?: ${NC}" 
    linode-cli regions ls --text --delimiter "," | awk -F"," '{print "\033[32m"$1" \t " $2" \033[0m";}' | tail -n+2
    read region_id
<<<<<<< HEAD
    
    echo -e "${BYellow}Which Distro do you want to use?: ${NC} (linode/debian11 or linode/ubuntu20.04"
    read image_id
    
=======
       
>>>>>>> 270c9649e994c405ca7d06887f4bd4d4b5986071
    echo -e "${BYellow}What should we call it?: ${NC}"
    read label
    
    echo -e "${BYellow}What tag should it have?: ${NC}"
    read tag 
    
    echo -e "${BYellow}Set a Root Password: ${NC} (must be secure)"
    read -s root_pass
    echo
    
    echo -e "${BYellow}What will your limited username be?: ${NC}"
    read sudouser
    
    echo -e "${BYellow}What should the limited user password be?: ${NC}"
    read -s sudopass
    echo 
    
    echo -e "${BYellow}Disable SSH for Root?: ${NC} (Yes/No)"
    read dis_root

JSON="{
    \"username\":\"${sudouser}\",
    \"password\":\"${sudopass}\",
    \"pubkey\":\"${pub_key}\",
    \"disable_root\":\"${dis_root}\"
    }"

#Use the CLI to deploy a secured Linode
    linode-cli linodes create \
        --image $image_id \
        --type $plan \
        --authorized_keys "$(cat $HOME/.ssh/id_rsa.pub))" \
        --root_pass $root_pass \
        --region  $region_id  \
        --label $label \
        --tags $tag \
        --stackscript_id 692092  \
        --stackscript_data "$JSON" \
        --image "linode/debian11" \
        --no-defaults