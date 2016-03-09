#!/bin/bash
n="nx7"

printf "// rj's tablet\n"
# standard user...
./users/user-common.sh -n $n -a $n -N ${netnr}
printf '  Pass = %s\n\n' $(pass ls user-rj-device-nx7-znchash)

for net in users/rj/networks/*.tpl ; do
  netname=$(basename $net .tpl)
  ./users/network-common.sh -N ${netname} -n $n -a $n -s "127.0.0.1 6667 rj/${netname}:${selfpw}"
done

printf '</User>\n'
