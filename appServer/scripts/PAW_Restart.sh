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

$SCRIPT_HOME/PAW_Stop.sh $ENV_NAME

if $SCRIPT_HOME/PAW_Start.sh $ENV_NAME
then 
    echo "Successfully started the PAW Server ${Server_Name}"
else 
    echo "Failed to start the PAW Server ${Server_Name}"
    exit 100
fi