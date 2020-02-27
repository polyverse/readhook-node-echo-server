#!/bin/bash

build()
{
	docker build -t polyverse/readhook-node-echo-server .
}

build
