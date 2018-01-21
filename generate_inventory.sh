#!/bin/bash


echo '[master]'
# Read managers
while read host separator ip; do
  private_ip=$(terraform output | sed -n "s/^${host%public}private = \(.*\)/\1/p")
  echo "${host%.ip.public} ansible_host=$ip private_ip=$private_ip"
done < <(terraform output | egrep "^manager.*ip\.public")

echo ""

echo '[node]'
# Read workers
while read host separator ip; do
  private_ip=$(terraform output | sed -n "s/^${host%public}private = \(.*\)/\1/p")
  echo "${host%.ip.public} ansible_host=$ip private_ip=$private_ip"
done < <(terraform output | egrep "^worker.*ip\.public")

echo ""
echo '[kube-cluster:children]
master
node'
