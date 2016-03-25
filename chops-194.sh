#!/bin/bash

# source common components
. ./com.inc

SELF=$(basename ${0} .sh)
export SELF

printf 'building configuration for %s\n' "${SELF}"


export SCRATCHDIR=$(mktemp -d)
mkdir -p "${SCRATCHDIR}/configs"
cat core.conf > "${SCRATCHDIR}/configs/znc.conf"
printf 'LoadModule = certauth\n' >> "${SCRATCHDIR}/configs/znc.conf"
mkdir -p "${SCRATCHDIR}/moddata/certauth"

if [ ! -f 'work.pem' ] ; then
  openssl req -nodes -newkey rsa:4096 -keyout work.pem -x509 -days 732 -out work.pem -subj '/CN=work'
fi

fp=$(openssl x509 -sha1 -noout -fingerprint -in work.pem | sed -e 's/^.*=//;s/://g;y/ABCDEF/abcdef/')
printf 'work %s%%20;' ${fp} >> "${SCRATCHDIR}/moddata/certauth/.registry"

for listener in listeners/${SELF}/*.conf ; do
  cat "${listener}" >> "${SCRATCHDIR}/configs/znc.conf"
done

for user in users/*.tpl ; do
  "./${user}" >> "${SCRATCHDIR}/configs/znc.conf"
done

tar cf ${SELF}-config.tar -C "${SCRATCHDIR}" .

rm -rf "${SCRATCHDIR}"
