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

  
	propFileLocation=$Profile_Home/properties 	
	echo ${serverName}
	echo ${serverMaps}
	#echo "ear file location ${earFile}"
	echo "$jaclString"
	echo "$propFileLocation/wsadmin.properties"

     #if $WAS_HOME/bin/wsadmin.sh -p "$propFileLocation/wsadmin.properties" -c "$jaclString" $security
	 if $WAS_HOME/bin/wsadmin.sh -p "$propFileLocation/wsadmin.properties" -c "$jaclString"
     then
         echo "Successfully installed the ear, saving the configuration"
         wsadmin_cmd="\$AdminConfig save"
         #$WAS_HOME/bin/wsadmin.sh -p "$propFileLocation/wsadmin.properties" -c "$wsadmin_cmd" $security
		 $WAS_HOME/bin/wsadmin.sh -p "$propFileLocation/wsadmin.properties" -c "$wsadmin_cmd"

     else 
         echo "Failed to install the ear, aborting"
         exit 100
     fi


