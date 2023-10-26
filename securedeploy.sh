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

    echo -e "${BYellow}What size plan should we deploy? (Enter ID): ${NC}"
    linode-cli linodes types --format id,label
    read plan
    
    echo -e  "${BYellow}Where do you want to deploy this Linode (Enter ID)?: ${NC}" 
    linode-cli regions ls --format id,label
    read region_id
    
    echo -e "${BYellow}Which Distro do you want to use?: ${NC} (linode/debian10 | linode/debian11 | linode/ubuntu20.04)"
    read image
    
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
        --image $image \
        --type $plan \
        --authorized_keys "$(cat $HOME/.ssh/id_rsa.pub))" \
        --root_pass $root_pass \
        --region  $region_id  \
        --label $label \
        --tags $tag \
        --stackscript_id 692092  \
        --stackscript_data "$JSON" \
        --no-defaults
