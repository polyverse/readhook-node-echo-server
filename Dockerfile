FROM	polyverse/node-echo-server

WORKDIR /
RUN	apk update

ADD	https://github.com/polyverse/readhook/releases/download/latest/basehook.so /tmp/basehook.so
ADD	https://github.com/polyverse/readhook/releases/download/latest/fullhook.so /tmp/fullhook.so

ENV	LD_PRELOAD "/tmp/basehook.so /tmp/fullhook.so"
