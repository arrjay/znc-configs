#!/bin/bash

printf "// FreeNode (rj|rbergero)\n"
./users/network-common.sh -N freenode -n rj -a rbergero -M 'sasl route_replies' -s 'irc.freenode.net 6667' -q '*explosions*'

# create log bucket
mkdir -p "${SCRATCHDIR}/users/rj/moddata/log/freenode"

# create sasl module data
mkdir -p "${SCRATCHDIR}/users/rj/networks/freenode/moddata/sasl"
passdata=$(pass ls user-rj-network-freenode|head -n1|./znc_escape.sh)
userdata=$(pass ls user-rj-network-freenode|tail -n1|awk -F': ' '{print $2}')
cat << EOF > "${SCRATCHDIR}/users/rj/networks/freenode/moddata/sasl/.registry"
password ${passdata}
require%5f;auth yes
username ${userdata}
EOF
