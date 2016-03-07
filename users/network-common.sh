#!/bin/bash

altnick=''
bindhost=''
encoding='^UTF-8'
ident=''
joindelay='0'
loadmodules=''
nick=''
quitmsg='Got Znc?'
realname=''
server=''
netname=''

while getopts 'a:e:i:I:j:M:N:n:q:r:s:' opt ; do
  case $opt in
    a)
      # (a)ltnick
      altnick=${OPTARG}
      ;;
     I)
       # (I)p bound (bindhost)
       bindhost=${OPTARG}
       ;;
     e)
       # (e)ncoding
       encoding=${OPTARG}
       ;;
     i)
       # (i)dent
       ident=${OPTARG}
       ;;
     N)
       # IRC network name
       netname=${OPTARG}
       ;;
     j)
       # (j)oindelay
       joindelay=${OPTARG}
       ;;
     M)
       # (M)odules
       loadmodules=${OPTARG}
       ;;
     n)
       # (n)ick
       nick=${OPTARG}
       ;;
     q)
       # (q)uitmsg
       quitmsg=${OPTARG}
       ;;
     r)
       # (r)ealname
       realname=${OPTARG}
       ;;
     s)
       # (s)erver string
       server=${OPTARG}
       ;;
  esac
done

if [ -z "${netname}" ] ; then
  echo "network name required" 1>&2
  exit 1
fi

if [ -z "${nick}" ] ; then
  echo "nick required" 1>&2
  exit 1
fi

if [ -z "${server}" ] ; then
  echo "server required" 1>&2
  exit 1
fi

if [ -z "${altnick}" ] ; then
  altnick="${nick}_"
fi

if [ -z "${ident}" ] ; then
  ident="${nick}"
fi

if [ -z "${realname}" ] ; then
  realname="${nick}"
fi

cat << EOF
  <Network ${netname}>
    AltNick = ${altnick}
EOF
if [ ! -z "${bindhost}" ] ; then printf '    Bindhost = %s\n' "${bindhost}" ; fi
cat << EOF
    Encoding = ${encoding}
    FloodBurst = 4
    FloodRate = 1.00
    IRCConnectEnablbed = true
    Ident = ${ident}
    Joindelay = ${joindelay}
EOF
if [ ! -z "${loadmodules}" ] ; then
  for mod in ${loadmodules} ; do
    printf '    LoadModule = %s\n' ${mod}
  done
fi
cat << EOF
    Nick = ${nick}
    QuitMsg = ${quitmsg}
    RealName = ${realname}
    Server = ${server}
  </Network>
EOF
