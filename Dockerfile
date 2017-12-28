FROM	polyverse/node-echo-server

RUN	apk update
RUN	apk add bash curl gcc git libc-dev

WORKDIR /
RUN	git clone https://github.com/polyverse-security/redhook.git
RUN	gcc -fPIC -shared -o redhook/redhook.so redhook/redhook.c -ldl

ENV	LD_PRELOAD /redhook/redhook.so

EXPOSE	8080
CMD	["node", "echo-server.js"]
