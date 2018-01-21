#!/bin/bash

buildtarget()
{
	command="docker build --no-cache -t polyverse/readhook-node-echo-server -t internal.hub.polyverse.io/readhook-node-echo-server ."
	echo $command
	$command
}

buildtarget

if [ "$1" == "-p" ]; then
	docker push polyverse/readhook-node-echo-server
	docker push internal.hub.polyverse.io/readhook-node-echo-server
fi
