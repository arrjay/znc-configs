#!/bin/bash

printf "// rj's bitlbee network\n"
./users/network-common.sh -N bitlbee -n rj -a rj -M 'route_replies colloquy perform' -s 'bitlbee 6667' -q 'The window station is shutting down'

# create log bucket
mkdir -p "${SCRATCHDIR}/users/rj/moddata/log/bitlbee"

# create perform module data
mkdir -p "${SCRATCHDIR}/users/rj/networks/bitlbee/moddata/perform"
passdata=$(pass ls user-rj-network-bitlbee|head -n1|./znc_escape.sh)
cat << EOF > "${SCRATCHDIR}/users/rj/networks/bitlbee/moddata/perform/.registry"
Perform PRIVMSG%20;%26;bitlbee%20;%3a;identify%20;${passdata}%0a;
EOF
