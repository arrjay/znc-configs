#!/bin/bash
export netnr=$(ls users/rj/networks|wc -l)
export selfpw=$(pass ls user-rj-clear)

printf "// rj's primary-to-znc user\n"
# this user gets localhost-only.
./users/user-common.sh -n rj -I 127.0.0.1 -a arrjay -r 'RJ Bergeron' -N "${netnr}" -M log
printf '  Pass = %s\n\n' $(pass ls user-rj-znchash)

# create log directory now
mkdir -p "${SCRATCHDIR}/users/rj/moddata/log"

for net in users/rj/networks/*.tpl ; do
  ./$net
done

printf '</User>\n'

for dev in users/rj/devices/*.tpl ; do
  ./$dev
done
