#!/bin/bash

apt-get update
sleep 2s

# if python install fails, update and retry
loopcount=0
while ! apt-get install -y python; do
	apt-get update
	# Break loop after 3 retries
	if [[ "$(( loopcount++ ))" -gt "3" ]] ; then
		echo "ERROR: apt-get install loop failed after $loopcount retries"
	       	exit 1
	fi
done

echo "OK - Ansible dependencies installed"
exit 0
