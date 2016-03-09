#!/bin/bash
n="rj-mbp"

printf "// rj's macbook\n"
# standard user...
./users/user-common.sh -n $n -a $n -N ${netnr}
printf '  Pass = %s\n\n' $(pass ls user-rj-device-mbp-znchash)

for net in users/rj/networks/*.tpl ; do
  netname=$(basename $net .tpl)
  ./users/network-common.sh -N ${netname} -n $n -a $n -s "znc 6667 rj/${netname}:${selfpw}"
done

printf '</User>\n'
