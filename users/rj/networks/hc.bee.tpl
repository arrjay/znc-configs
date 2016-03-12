#!/bin/bash

printf "// rj's hipchat bitlbee network\n"
./users/network-common.sh -N hc.bee -n rj -a rj -M 'route_replies colloquy perform' -s 'hc.bee 6667' -q 'oh no, oh my'

# create log bucket
mkdir -p "${SCRATCHDIR}/users/rj/moddata/log/hc.bee"

# create perform module data
mkdir -p "${SCRATCHDIR}/users/rj/networks/hc.bee/moddata/perform"
passdata=$(pass ls user-rj-network-hc.bee|head -n1|./znc_escape.sh)
cat << EOF > "${SCRATCHDIR}/users/rj/networks/hc.bee/moddata/perform/.registry"
Perform PRIVMSG%20;%26;bitlbee%20;%3a;identify%20;${passdata}%0a;
EOF
