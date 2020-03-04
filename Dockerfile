FROM	polyverse/node-echo-server:854f6f20a5ba4f025ffe125da139d5bd024e7d39

# Packages needed by our interventions (Moved up so docker will have the layer cached during development)
RUN     DEBIAN_FRONTEND=noninteractive bash -c "(apt-get -qq update && apt-get -yqq install libunwind-dev libsystemd-dev)"

# Code motion
ADD     vendor/polyverse-security/twiddler-dev.tar /opt/pv/twiddler

# Readhook
ADD	vendor/polyverse/basehook.so /tmp/basehook.so
ADD	vendor/polyverse/fullhook.so /tmp/fullhook.so

CMD	mkdir -p /sys/fs/cgroup/freezer/user/mariusz/0/suspendgroup && LD_PRELOAD="/tmp/fullhook.so:/tmp/basehook.so:/opt/pv/twiddler/libpe_binary_scrambler_hook.so" nodejs /src/echo-server.js
