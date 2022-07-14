#!/bin/sh

FID=$(id -un)

COLOR_RED='\e[0;31m'    # normal Red
COLOR_GREEN='\e[0;32m'  # normal Green
COLOR_MAG='\e[0;35m'  # normal Magenta
RESET='\e[0;1;00m'      # normal white

HOST=$(hostname)
SCRIPT_HOME=/opt/middleware/raws/scripts

if [ "$#" -lt "1" ]; then
  echo "Usage: `basename $0` <environment name>"
  echo "Options for Operation - dev"
  exit 2
fi

ENV_NAME=$1
export ENV_NAME
. $SCRIPT_HOME/PAW_Env_Details.sh

	
echo "Status of DMGR:$HOST"
$DMGR_HOME/bin/serverStatus.sh dmgr

echo "Status of Nodeagent :$HOST"
$Profile_Home/bin/serverStatus.sh -all


JobPID=`ps -aef | grep java |grep -v grep | grep "dmgr" | awk '{print($2)}'`
if test "$JobPID" != ""
then
  echo -e "Checking Deployment Manager \t\t\t ${COLOR_GREEN}Running - PID =  "$JobPID ${RESET}
else
  echo -e "Checking Deployment Manager \t\t\t\t\t ${COLOR_RED}Not Running" ${RESET}
fi

JobPID=`ps -aef | grep java |grep -v grep | grep "nodeagent" | awk '{print($2)}'`
if test "$JobPID" != ""
then
  echo -e "Checking Nodeagent \t\t\t\t ${COLOR_GREEN}Running - PID =  "$JobPID ${RESET}
else
  echo -e "Checking Nodeagent \t\t\t\t ${COLOR_RED}Not Running" ${RESET}
fi

JobPID=`ps -aef | grep java |grep -v grep | grep "${serverName}" | awk '{print($2)}'`
if test "$JobPID" != ""
then
  echo -e "Checking Application Server \t\t\t ${COLOR_GREEN}Running - PID =  "$JobPID ${RESET}
else
  echo -e "Checking Application Server \t\t\t\t ${COLOR_RED}Not Running" ${RESET}
fi

