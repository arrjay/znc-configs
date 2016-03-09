#!/bin/bash

printf "// FreeNode (hwin)\n"
./users/network-common.sh -N freenode -M 'sasl route_replies' -n hwin -s 'irc.freenode.net 6667' -q 'sosumi.au'

# create sasl module data
mkdir -p "${SCRATCHDIR}/users/hwin/networks/freenode/moddata/sasl"
passdata=$(pass ls user-hwin-network-freenode|head -n1|./znc_escape.sh)
userdata=$(pass ls user-hwin-network-freenode|tail -n1|awk -F': ' '{print $2}')
cat << EOF > "${SCRATCHDIR}/users/hwin/networks/freenode/moddata/sasl/.registry"
password ${passdata}
require%5f;auth yes
username ${userdata}
EOF
