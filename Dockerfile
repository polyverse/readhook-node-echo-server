FROM	polyverse/node-echo-server

WORKDIR /
RUN	apk update
RUN	apk add gcc git libc-dev

RUN	git clone https://github.com/polyverse-security/redhook.git
RUN	gcc -fPIC -shared -o redhook/redhook.so redhook/redhook.c -ldl

ENV	LD_PRELOAD /redhook/redhook.so
