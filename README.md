# readhook-node-echo-server
Test bed for using readhook to hook node-echo-server application.
## Running
    docker run -d --rm --name echo -p 8080:8080 polyverse/readhook-node-echo-server
## Stopping
    docker kill echo
## Running interactively
    docker run -it --rm --name echo -p 8080:8080 polyverse/readhook-node-echo-server /bin/sh
    node echo-server.js
