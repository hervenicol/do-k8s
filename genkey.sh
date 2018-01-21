#!/bin/bash

ssh-keygen -N "" -f keys/kubekey
cp keys/kubekey.pub ansible/roles/kubeadm/files/
