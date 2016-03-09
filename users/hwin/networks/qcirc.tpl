#!/bin/bash

printf '// qc-irc network\n'
./users/network-common.sh -N qcirc -M 'nickserv route_replies' -n hwin -s 'irc.orospakr.ca 6667' -q 'there is water, at the bottom of the ocean!'

# create nickserv module data
mkdir -p "${SCRATCHDIR}/users/hwin/networks/qcirc/moddata/nickserv"
passdata=$(pass ls user-hwin-network-qcirc|head -n1|./znc_escape.sh)
cat << EOF > ${SCRATCHDIR}/users/hwin/networks/qcirc/moddata/nickserv/.registry
IdentifyCmd PRIVMSG%20;NickServ%20;%3a;IDENTIFY%20;%7b;password%7d;
Password ${passdata}
EOF
