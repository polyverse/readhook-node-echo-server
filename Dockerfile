FROM	polyverse/node-echo-server

WORKDIR /
RUN	apk update

ADD	https://github.com/polyverse/readhook/releases/download/jenkins/basehook.so /tmp/basehook.so
ADD	https://github.com/polyverse/readhook/releases/download/jenkins/fullhook.so /tmp/fullhook.so

ENV	LD_PRELOAD "/tmp/fullhook.so /tmp/basehook.so"
