#!/bin/bash
export netnr=$(ls users/hwin/networks|wc -l)
export selfpw=$(pass ls user-hwin-clear)

case ${SELF} in
core)
printf "// mo's primary-to-znc user\n"
# this user gets localhost-only.
./users/user-common.sh -C -n hwin -a hwin_ -r 'Mo' -N "${netnr}"
printf '  Pass = %s\n\n' $(pass ls user-hwin-znchash)

for net in users/hwin/networks/*.tpl ; do
  ./$net
done

printf '</User>\n'
;;
chops-7001)
# currently noop
;;
*)
for dev in users/hwin/${SELF}/*.tpl ; do
  ./$dev
done
;;
esac
