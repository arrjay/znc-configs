#!/bin/bash

passdata=$(pass ls user-rj-network-lisa-slack|head -n1)
printf "//slack-LISA\n"
./users/network-common.sh -N lisa-slack -n rj -a rj_ -M route_replies -s "usenix-lisa.irc.slack.com +6697 usenix-lisa.${passdata}"
