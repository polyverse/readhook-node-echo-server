FROM	polyverse/node-echo-server

WORKDIR /
RUN	apk update
RUN	apk add bash curl gcc git libc-dev 
RUN	apk add gdb git make nasm python

WORKDIR /root
RUN	git clone https://github.com/longld/peda.git
RUN	echo "source /root/peda/peda.py" >> /root/.gdbinit
RUN	echo 'peda.execute("set breakpoint pending on")' >> /root/peda/peda.py

#COPY	redhook/redhook.c redhook/redhook.c
RUN	git clone https://github.com/polyverse-security/redhook.git

RUN	gcc -fPIC -shared -o redhook/redhook.so redhook/redhook.c -ldl
RUN	gcc -DREDHOOK_MAIN=1 -g -fPIC -o redhook/redhook redhook/redhook.c

ENV	LD_PRELOAD /root/redhook/redhook.so
