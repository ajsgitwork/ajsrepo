#!/bin/sh

SCRIPT_HOME=/opt/middleware/raws/scripts

if [ $# -ne 1 ]; then
     echo "Usage: $0 Environment"
     echo "Possible values for Environment are {dev,uat,prod}"
     exit 100
fi

if [ ! -f "/opt/middleware/raws/ear/raws-SNAPSHOT.war" ]; then 
	echo "war file does not exist"
	exit 100;
else
	echo "Starting for deployment process"
fi 

ENV_NAME=$1
export ENV_NAME
. $SCRIPT_HOME/PAW_Env_Details.sh

echo "Stopping the servers..."
$SCRIPT_HOME/PAW_Stop.sh $ENV_NAME
sleep 3;
echo "Uninstalling the Application..."

$SCRIPT_HOME/PAW_Uninstall.sh $ENV_NAME  >> $SCRIPT_HOME/PAW_Deploy.log

echo "Installing the Application..."

if $SCRIPT_HOME/PAW_Install.sh $ENV_NAME >> $SCRIPT_HOME/PAW_Deploy.log
then
     echo "Deployed the war to the Application env $1 on $(date)" >> $SCRIPT_HOME/PAW_Deploy.log
     sleep 10;
	 echo "Starting the servers..."
     $SCRIPT_HOME/PAW_Start.sh $ENV_NAME	
else 
     echo "Deployed the war to the Application env $1 on $(date)" >> $SCRIPT_HOME/PAW_Deploy.log
fi

