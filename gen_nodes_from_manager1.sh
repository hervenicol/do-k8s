#!/bin/bash

for nb in {2..3}; do
  sed "s/manager1/manager$nb/g" manager1.tf > manager$nb.tf
done
for nb in {1..5}; do
  sed "s/manager1/worker$nb/g" manager1.tf > worker$nb.tf
done
