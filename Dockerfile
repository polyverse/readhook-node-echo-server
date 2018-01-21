FROM	polyverse/node-echo-server

WORKDIR /
RUN	apk update

ADD	https://github.com/polyverse/readhook/releases/download/v0.0.0/readhook.so /readhook/readhook.so

ENV	LD_PRELOAD /readhook/readhook.so
