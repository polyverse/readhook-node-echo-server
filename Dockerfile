FROM	polyverse/node-echo-server

WORKDIR /src

ADD	https://github.com/polyverse/readhook/releases/download/jenkins/basehook.so /tmp/basehook.so
ADD	https://github.com/polyverse/readhook/releases/download/jenkins/fullhook.so /tmp/fullhook.so

CMD	LD_PRELOAD="/tmp/fullhook.so /tmp/basehook.so" node /src/echo-server.js
