#!/bin/bash

build()
{
	docker build --no-cache -t polyverse/readhook-node-echo-server .
}

build
