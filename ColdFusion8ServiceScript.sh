#!/bin/sh

# chkconfig: 345 90 14
# description: starts the MultiServer cfusion instance

if [ -f /etc/rc.common ]; then
. /etc/rc.common
fi

#
# Start ColdFusion Multiserver 
#
# Because this is a start up script, and will be run by root, we use a specific 
# user (the user who installed) to run ColdFusion

CF_DIR="/usr/local/jrun4"
RUNTIME_USER=""apache""

# 1.0/Initial
#
##

if [ ${1:-noset} = "stop" ]; then
  su $RUNTIME_USER -c "$CF_DIR/bin/jrun -stop cs-gateway-1"
  su $RUNTIME_USER -c "$CF_DIR/bin/jrun -stop cs-landings-1"
  su $RUNTIME_USER -c "$CF_DIR/bin/jrun -stop cs-wsou-1"
#  su $RUNTIME_USER -c "$CF_DIR/bin/jrun -stop cs-apps-1"
  su $RUNTIME_USER -c "$CF_DIR/bin/jrun -stop cs-crisis-1"
  su $RUNTIME_USER -c "$CF_DIR/bin/jrun -stop cfusion"
  exit 0
fi

su $RUNTIME_USER -c "$CF_DIR/bin/jrun -start cs-gateway-1 >& $CF_DIR/logs/cs-gateway-1-event.log &"
su $RUNTIME_USER -c "$CF_DIR/bin/jrun -start cs-landings-1 >& $CF_DIR/logs/cs-landings-1-event.log &"
su $RUNTIME_USER -c "$CF_DIR/bin/jrun -start cs-wsou-1 >& $CF_DIR/logs/cs-wsou-1-event.log &"
#su $RUNTIME_USER -c "$CF_DIR/bin/jrun -start cs-apps-1 >& $CF_DIR/logs/cs-apps-1-event.log &"
su $RUNTIME_USER -c "$CF_DIR/bin/jrun -start cs-crisis-1 >& $CF_DIR/logs/cs-crisis-1-event.log &"
su $RUNTIME_USER -c "$CF_DIR/bin/jrun -start cfusion >& $CF_DIR/logs/cfusion-event.log &"

#eof