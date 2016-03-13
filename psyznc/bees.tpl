#!/bin/bash

# actually...we wrote a psyBNC config here
#  to take advantage of their network smooshing.
corepass=$(pass ls user-rj-clear)
bncpass=$(pass ls user-rj-bees.psybnc-clear)
cat << EOF
# NOTE: PSYBNC.SYSTEM.ME will be added by our docker startup script.

# Default listener
PSYBNC.SYSTEM.PORT1=6667
PSYBNC.SYSTEM.HOST1=*
PSYBNC.HOSTALLOWS.ENTRY0=*;*

# Default user
USER1.USER.NICK=rj
USER1.USER.USER=rj
USER1.USER.PASS=${bncpass}
USER1.USER.RIGHTS=1
USER1.USER.VLINK=0
USER1.USER.LOGIN=rj
USER1.SERVERS.SERVER1=znc
USER1.SERVERS.PORT1=6667
USER1.SERVERS.SPASS1=rj@neworder/core.bee:${corepass}
USER1.CHANNELS.ENTRY0=&bitlbee
USER2.USER.LOGIN=rj
USER2.USER.USER=rj
USER2.USER.PASS==${bncpass}
USER2.USER.NETWORK=fb
USER2.USER.RIGHTS=1
USER2.USER.VLINK=0
USER2.USER.PPORT=0
USER2.USER.PARENT=1
USER2.USER.QUITTED=0
USER2.USER.DCCENABLED=0
USER2.USER.AUTOGETDCC=0
USER2.USER.AIDLE=0
USER2.USER.LEAVEQUIT=0
USER2.USER.AUTOREJOIN=0
USER2.USER.SYSMSG=0
USER2.USER.LASTLOG=0
USER2.USER.NICK=rj
USER2.SERVERS.SERVER1=znc
USER2.SERVERS.PORT1=6667
USER2.SERVERS.SPASS1=rj@neworder/fb.bee:${corepass}
USER2.CHANNELS.ENTRY0=&bitlbee
USER3.USER.LOGIN=rj
USER3.USER.USER=rj
USER3.USER.PASS==${bncpass}
USER3.USER.NETWORK=hc
USER3.USER.RIGHTS=1
USER3.USER.VLINK=0
USER3.USER.PPORT=0
USER3.USER.PARENT=1
USER3.USER.QUITTED=0
USER3.USER.DCCENABLED=0
USER3.USER.AUTOGETDCC=0
USER3.USER.AIDLE=0
USER3.USER.LEAVEQUIT=0
USER3.USER.AUTOREJOIN=0
USER3.USER.SYSMSG=0
USER3.USER.LASTLOG=0
USER3.USER.NICK=rj
USER3.SERVERS.SERVER1=znc
USER3.SERVERS.PORT1=6667
USER3.SERVERS.SPASS1=rj@neworder/hc.bee:${corepass}
USER3.CHANNELS.ENTRY0=&bitlbee

EOF
