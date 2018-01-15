FROM	polyverse/node-echo-server

WORKDIR /
RUN	apk update

ADD	https://github.com/polyverse-security/redhook/releases/download/v0.0.0/redhook.so /redhook/redhook.so

ENV	LD_PRELOAD /redhook/redhook.so
