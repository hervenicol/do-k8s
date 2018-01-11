#!/bin/bash

# Followed doc from there:
# https://www.digitalocean.com/community/tutorials/how-to-use-terraform-with-digitalocean

# DO token (Personal Access Token)
export DO_PAT=$(cat /home/herve/Documents/do/generic_do_token.pat)

# ssh key fingerprint
ssh_fingerprint=$(ssh-keygen -lE md5 -f ~/.ssh/id_rsa.do.pub | awk '{print $2}')
export ssh_fingerprint=${ssh_fingerprint#MD5:}

## log TF to stdout - debug
#export TF_LOG=1

export pub_key="/home/herve/.ssh/id_rsa.do.pub"
export pvt_key="/home/herve/.ssh/id_rsa_clear.do"

