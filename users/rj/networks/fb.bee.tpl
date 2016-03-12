#!/bin/bash

printf "// rj's facebook bitlbee network\n"
./users/network-common.sh -N fb.bee -n rj -a rj -M 'route_replies colloquy perform' -s 'fb.bee 6667' -q "you might get what you're after"

# create log bucket
mkdir -p "${SCRATCHDIR}/users/rj/moddata/log/fb.bee"

# create perform module data
mkdir -p "${SCRATCHDIR}/users/rj/networks/fb.bee/moddata/perform"
passdata=$(pass ls user-rj-network-fb.bee|head -n1|./znc_escape.sh)
cat << EOF > "${SCRATCHDIR}/users/rj/networks/fb.bee/moddata/perform/.registry"
Perform PRIVMSG%20;%26;bitlbee%20;%3a;identify%20;${passdata}%0a;
EOF
