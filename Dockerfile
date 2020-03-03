FROM	polyverse/node-echo-server:daed7b69ee5a6c17214efb4ba474d58205ace951

WORKDIR	/src
RUN	apk update && apk add curl wget ca-certificates && update-ca-certificates

ADD	vendor/polyverse/basehook.so /tmp/basehook.so
ADD	vendor/polyverse/fullhook.so /tmp/fullhook.so

CMD	LD_PRELOAD="/tmp/fullhook.so:/tmp/basehook.so" node /src/echo-server.js
