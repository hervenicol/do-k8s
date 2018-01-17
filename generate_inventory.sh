#!/bin/bash


echo '[master]'
# Read managers
while read host separator ip; do
  echo "$ip"
done < <(terraform output | grep ^manager)

echo ""

echo '[node]'
# Read workers
while read host separator ip; do
  echo $ip
done < <(terraform output | grep ^worker)

echo 'kube-cluster:children]
master
node'
