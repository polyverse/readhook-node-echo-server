#!/bin/bash
docker run -it --rm --name echo -p 8080:8080 polyverse/readhook-node-echo-server $1
