#!/bin/bash
export netnr=$(ls users/hwin/networks|wc -l)
export selfpw=$(pass ls user-hwin-clear)

printf "// mo's primary-to-znc user\n"
# this user gets localhost-only.
./users/user-common.sh -n hwin -I 127.0.0.1 -a hwin_ -r 'Mo' -N "${netnr}"
printf '  Pass = %s\n\n' $(pass ls user-hwin-znchash)

for net in users/hwin/networks/*.tpl ; do
  ./$net
done

printf '</User>\n'

for dev in users/hwin/devices/*.tpl ; do
  ./$dev
done
