#!/bin/bash
SHORT_DESCRIPTION="Test for redhook of polyverse/node-echo-server"

USAGE="$(cat <<EOF

Usage: sh run.sh ${0##*/}

$SHORT_DESCRIPTION

EOF
)"

if [ $# -ne 0 ]; then
  printf "$USAGE\n\n"
  exit 1
fi

# Use this command to run
docker run -it --rm --privileged --name redhook-node-echo-server -p 8080:8080 polyverse/redhook-node-echo-server
#docker run -it --rm --privileged --entrypoint /bin/bash --name redhook-node-echo-server -p 8080:8080 polyverse/redhook-node-echo-server
