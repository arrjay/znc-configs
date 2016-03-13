#!/bin/bash

# source common components
. ./com.inc

for tpl in psyznc/*.tpl ; do
  export SCRATCHDIR=$(mktemp -d)
  cdest=$(basename ${tpl} .tpl)
  printf 'building configuration for %s\n' "${cdest}"
  "./${tpl}" >> "${SCRATCHDIR}/psybnc.conf"
  tar cf ${cdest}-config.tar -C "${SCRATCHDIR}" .
  rm -rf "${SCRATCHDIR}"
done

