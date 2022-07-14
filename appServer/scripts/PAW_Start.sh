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

Server_Name=$serverName
     
	if $Profile_Home/bin/startServer.sh $Server_Name
	     	then 
		    echo "`date` Started server: ${Server_Name}"	>> $SCRIPT_HOME/PAW_events.out
		    echo "Successfully started the PAW Server ${Server_Name}" 
		else 
		    echo "`date` Starting  server: ${Server_Name} FAILED"	>> $SCRIPT_HOME/PAW_events.out
		    echo "Failed to start the PAW Server ${Server_Name}"
         	    exit 100
	
     	fi