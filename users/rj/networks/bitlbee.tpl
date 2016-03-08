#!/bin/bash

printf "// rj's bitlbee network\n"
./users/network-common.sh -N bitlbee -n rj -a rj -M 'sasl route_replies' -s 'bitlbee 6667' -q 'The window station is shutting down'

# create log bucket
mkdir -p "${SCRATCHDIR}/users/rj/moddata/log/bitlbee"

# create sasl module data
mkdir -p "${SCRATCHDIR}/users/rj/networks/bitlbee/moddata/sasl"
passdata=$(pass ls user-rj-network-bitlbee|head -n1|./znc_escape.sh)
userdata=$(pass ls user-rj-network-bitlbee|tail -n1|awk -F': ' '{print $2}')
cat << EOF > "${SCRATCHDIR}/users/rj/networks/bitlbee/moddata/sasl/.registry"
password ${passdata}
require%5f;auth yes
username ${userdata}
EOF
