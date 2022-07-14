#!/bin/sh

#Executes a command with timeout. Does not wait for the command to finish and do not kill the process.
#Returns 1 if the command did not finish  on time.
#
# Example:
# 	exec_timeout 5  sleeep 10	 
# This example will fork the command "sleep 10" in background and will wait 5 seconds. After this period, the script
# will check if the command is still runninig and will set the return code according to the result.
# 

if [ "$#" -lt "2" ]; then
  echo "Usage: `basename $0` timeout-in-seconds  command-string"
  exit 2
fi

set -m
timeout=$1 && shift		#
"$@" &					# $@ has stored all arg in {"$1","$2"}; & runs the command in background
cmdPID=$!				# and get PID of the most recent background command which is nothing pid of exec_timeout.sh called by stop_appser
sleep $timeout				# eventually this line becomes..sleep 70 && shift...it means <command1> && <command2>...
							#means sleep 70 is true proceed for shift. This shift will call execution of stopServer script. Shift got the call 
							#from $@. So sleep and script execution happening in parallel.
							#As soon as sleep ends, grep will check whether PID still exist of not, 
rc=`ps | grep -v grep | grep $cmdPID`		#if success exit code 0 else 1. For ps cmd, success means grep found something hence exit code 0
											# kuch nahi mila grep se to comand fail hence exit code 1. Kuch mila grep se to success, exit code 0
if [ $? == 0 ]; then				#return 1 if the process is still running	
  echo "still stop command is running"
  exit 1
fi
