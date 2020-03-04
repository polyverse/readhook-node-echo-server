FROM	polyverse/node-echo-server:daed7b69ee5a6c17214efb4ba474d58205ace951

WORKDIR	/src
RUN	apk update && apk add bash curl wget ca-certificates && update-ca-certificates

# Packages needed by our interventions (Moved up so docker will have the layer cached during development)
RUN     apk add libunwind-dev

# Code motion
ADD     vendor/polyverse-security/twiddler-rel.tar /opt/pv/twiddler

# Readhook
ADD	vendor/polyverse/basehook.so /tmp/basehook.so
ADD	vendor/polyverse/fullhook.so /tmp/fullhook.so

CMD	mkdir -p /sys/fs/cgroup/freezer/user/mariusz/0/suspendgroup && LD_PRELOAD="/tmp/fullhook.so:/tmp/basehook.so:/opt/pv/twiddler/libpe_binary_scrambler_hook.so" node /src/echo-server.js
