# readhook-node-echo-server
Test bed for using readhook to hook node-echo-server application.
## Running
```
docker run -dt --rm -p 8080:8080 polyverse/readhook-node-echo-server
```
## Running interactively
```
docker run -it --rm -p 8080:8080 polyverse/readhook-node-echo-server /bin/sh
node echo-server.js
```
