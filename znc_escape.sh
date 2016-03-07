#!/bin/bash

read string2enc
strlen=${#string2enc}
encoded=""
pos=0
c=''
o=''

for (( pos=0 ; pos < strlen ; pos ++ )) ; do
  # grab one character
  c=${string2enc:$pos:1}
  case "$c" in
    [-_.a-zA-Z0-9] ) o="${c}" ;;
    * )               printf -v o '%%%02x;' "'$c"
  esac
  encoded+="${o}"
done

echo "${encoded}"
