#!/bin/sh

SCRIPT_HOME=/opt/middleware/raws/scripts

if [ $# -ne 1 ]; then
     echo "Usage: $0 Environment"
     echo "Possible values for Environment are {dev,uat,prod}"
     exit 100
fi

ENV_NAME=$1
export ENV_NAME
. $SCRIPT_HOME/PAW_Env_Details.sh

     appName=${appName}	
     propFileLocation=$Profile_Home/properties
     
     wsadmin_cmd="\$AdminApp uninstall $appName"
     #if $WAS_HOME/bin/wsadmin.sh -p "$propFileLocation/wsadmin.properties" -c "$wsadmin_cmd" $security
	 if $WAS_HOME/bin/wsadmin.sh -p "$propFileLocation/wsadmin.properties" -c "$wsadmin_cmd"
     then
         echo "Successfully Uninstalled the application"
	 wsadmin_cmd="\$AdminConfig save"
         #$WAS_HOME/bin/wsadmin.sh -p "$propFileLocation/wsadmin.properties" -c "$wsadmin_cmd" $security
		 $WAS_HOME/bin/wsadmin.sh -p "$propFileLocation/wsadmin.properties" -c "$wsadmin_cmd"

     else
         echo "Failed to Uninstall ear of ${env},aborting"
         exit 100
     fi