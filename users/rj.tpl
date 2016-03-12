#!/bin/bash
export netnr=$(ls users/rj/networks|wc -l)
export selfpw=$(pass ls user-rj-clear)

case ${SELF} in
core)
printf "// rj's primary-to-znc user\n"
./users/user-common.sh -C -n rj -a arrjay -r 'RJ Bergeron' -N "${netnr}" -M log
printf '  Pass = %s\n\n' $(pass ls user-rj-znchash)

# create log directory now
mkdir -p "${SCRATCHDIR}/users/rj/moddata/log"

for net in users/rj/networks/*.tpl ; do
  ./$net
done

printf '</User>\n'
;;
*)
for dev in users/rj/${SELF}/*.tpl ; do
  ./$dev
done
;;
esac
