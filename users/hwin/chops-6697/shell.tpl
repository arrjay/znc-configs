#!/bin/bash
n="hwin-shell"

printf "// hwin's shellhost\n"
# standard user...
./users/user-common.sh -n $n -a $n -N ${netnr}
printf '  Pass = %s\n\n' $(pass ls user-hwin-device-shell-znchash)

for net in users/hwin/networks/*.tpl ; do
  netname=$(basename $net .tpl)
  ./users/network-common.sh -N ${netname} -n $n -a $n -s "znc 6667 hwin/${netname}:${selfpw}"
done

printf '</User>\n'
