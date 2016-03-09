#!/bin/bash
n="moPhone"

printf "// hwin's phone\n"
# standard user...
./users/user-common.sh -n $n -a $n -N ${netnr}
printf '  Pass = %s\n\n' $(pass ls user-hwin-device-mophone-znchash)

for net in users/hwin/networks/*.tpl ; do
  netname=$(basename $net .tpl)
  ./users/network-common.sh -N ${netname} -n $n -a $n -s "localhost 6667 hwin/${netname}:${selfpw}"
done

printf '</User>\n'
