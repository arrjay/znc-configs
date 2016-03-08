#!/bin/bash

is_admin='false'
altnick=''
allow='*'
append_ts='false'
autoclear_chanbuffer='true'
autoclear_querybuffer='true'
buffer='50'
ident=''
maxnetworks='2'
multiclients='false'
nick=''
prependts='false'
quitmsg='Got ZNC?'
realname='ZNC User'
tsformat='[%H:%M:%S]'
maxquerybuffers='20'

# make parts of the znc user configuration that are common.
while getopts 'Aa:CFI:tBb:i:M:N:n:Pp:q:r:' opt ; do
  case $opt in
    A)
      # (A)dmin
      is_admin='true'
      ;;
    a)
      # (a)ltnick
      altnick=${OPTARG}
      ;;
    I)
      # (I)p allowed in (Allow)
      allow=${OPTARG}
      ;;
    T)
      # Append(T)imeStamp
      append_ts='true'
      ;;
    B)
      # AutoClear*(B)uffer
      autoclear_chanbuffer='false'
      autoclear_querybuffer='false'
      ;;
    b)
      # (b)uffer
      buffer=${OPTARG}
      ;;
## denyloadmod
## denysetbindhost
    i)
      # (i)dent
      ident=${OPTARG}
      ;;
## jointries
## maxjoins
    N)
      # Max(N)etworks
      maxnetworks=${OPTARG}
      ;;
    C)
      # Multi(C)lients
      multiclients='true'
      ;;
    n)
      # (n)ick
      nick=${OPTARG}
      ;;
    M)
      # Load(M)odule
      loadmodules=${OPTARG}
      ;;
    P)
      # (P)rependTimestamp
      prependts='true'
      ;;
    p)
      # PRIVMSG (Query) buffers
      maxquerybuffers=${OPTARG}
      ;;
    q)
      # (q)uitmsg
      quitmsg=${OPTARG}
      ;;
    r)
      # (r)ealname
      realname=${OPTARG}
      ;;
    F)
      # Timestemp(F)ormat
      tsformat=${OPTARG}
      ;;
  esac
done

if [ -z "${nick}" ] ; then
  echo "user nick not set" 1>&2
  exit 1
fi

if [ -z "${altnick}" ] ; then
  altnick="${nick}_"
fi

if [ -z "${ident}" ] ; then
  ident="${nick}"
fi

cat << EOF
<User ${nick}>
  Admin = ${is_admin}
  Allow = ${allow}
  AltNick = ${altnick}
  AppendTimestamp = ${append_ts}
  AutoClearChanBuffer = ${autoclear_chanbuffer}
  AutoClearQueryBuffer = ${autoclear_querybuffer}
  Buffer = ${buffer}
  DenyLoadMod = false
  DenySetBindHost = false
  Ident = ${ident}
  JoinTries = 4
EOF
if [ ! -z "${loadmodules}" ] ; then
  for mod in ${loadmodules} ; do
    printf '  LoadModule = %s\n' ${mod}
  done
fi
cat << EOF
  MaxJoins = 0
  MaxNetworks = ${maxnetworks}
  MaxQueryBuffers = ${maxquerybuffers}
  MultiClients = ${multiclients}
  Nick = ${nick}
  PrependTimestamp = ${prependts}
  QuitMsg = ${quitmsg}
  RealName = ${realname}
  TimestampFormat = ${tsformat}
EOF
