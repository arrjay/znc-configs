#!/bin/bash

printf '// qc-irc network\n'
./users/network-common.sh -N qcirc -n j -a rj -M nickserv -s 'irc.orospakr.ca 6667' -q 'oh no, oh my'

# create nickserv module data
mkdir -p "${SCRATCHDIR}/users/rj/networks/qcirc/moddata/nickserv"
passdata=$(pass ls user-rj-network-qcirc|head -n1|./znc_escape.sh)
cat << EOF > ${SCRATCHDIR}/users/rj/networks/qcirc/moddata/nickserv/.registry
IdentifyCmd PRIVMSG%20;NickServ%20;%3a;IDENTIFY%20;%7b;password%7d;
Password ${passdata}
EOF
