FROM	polyverse/node-echo-server

WORKDIR	/src
RUN	apk update && apk add curl wget ca-certificates && update-ca-certificates

ADD	https://github.com/plexsolutions/readhook/releases/download/v1.2.2/basehook.so /tmp/basehook.so
ADD	https://github.com/plexsolutions/readhook/releases/download/v1.2.2/fullhook.so /tmp/fullhook.so

CMD	LD_PRELOAD="/tmp/fullhook.so:/tmp/basehook.so" node /src/echo-server.js
