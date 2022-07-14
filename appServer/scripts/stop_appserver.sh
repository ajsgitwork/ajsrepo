#!/bin/sh

PROFILE=/opt/middleware/cloudapp/cloudapp_Runtime/profiles/cloudappCell/cloudapp1
SCRIPTS_HOME=/opt/middleware/raws/scripts
DEFAULT_TIMEOUT=70

myname=`basename $0`

if [ "$#" -lt "1" ]; then
  echo "Usage: `basename $0` appserver-name"
  exit 2
fi

$SCRIPTS_HOME/exec_timeout.sh $DEFAULT_TIMEOUT $PROFILE/bin/stopServer.sh $1


as=`ps -ef | grep -v grep | grep -v $myname | grep $1 | grep java`
if [ $? == 1 ]; then
        exit 0
fi

$PROFILE/bin/stopNode.sh
$SCRIPTS_HOME/kill_appserver.sh $1
$PROFILE/bin/startNode.sh
echo "`date` Application server $1 killed" >> /home/was5/scripts/FCR_events.out

