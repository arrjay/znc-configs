#!/bin/bash

# source common components
. ./com.inc

self=$(basename ${0} .sh)

printf 'building configuration for %s\n' "${self}"

export SCRATCHDIR=$(mktemp -d)
mkdir -p "${SCRATCHDIR}/configs"
cat core.conf > "${SCRATCHDIR}/configs/znc.conf"

for listener in listeners/*.conf ; do
  cat "${listener}" >> "${SCRATCHDIR}/configs/znc.conf"
done

for user in users/*.tpl ; do
  "./${user}" >> "${SCRATCHDIR}/configs/znc.conf"
done

#cat "${SCRATCHDIR}/configs/znc.conf"

#ls -AlR "${SCRATCHDIR}"

tar cf znc-config.tar -C "${SCRATCHDIR}" .

rm -rf "${SCRATCHDIR}"
