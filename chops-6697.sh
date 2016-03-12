#!/bin/bash

# source common components
. ./com.inc

SELF=$(basename ${0} .sh)
export SELF

printf 'building configuration for %s\n' "${SELF}"

export SCRATCHDIR=$(mktemp -d)
mkdir -p "${SCRATCHDIR}/configs"
cat core.conf > "${SCRATCHDIR}/configs/znc.conf"

for listener in listeners/${SELF}/*.conf ; do
  cat "${listener}" >> "${SCRATCHDIR}/configs/znc.conf"
done

for user in users/*.tpl ; do
  "./${user}" >> "${SCRATCHDIR}/configs/znc.conf"
done

tar cf ${SELF}-config.tar -C "${SCRATCHDIR}" .

rm -rf "${SCRATCHDIR}"
