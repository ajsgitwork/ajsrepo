#!/bin/sh

myname=`basename $0`

if [ "$#" -lt "1" ]; then
  echo "Usage: `basename $0` appserver-name"
  exit 2
fi

as=`ps -ef | grep -v grep | grep -v $myname | grep $1 | grep java`		   
echo "$as\n" >> /home/wasadm/scripts/kill.out

as=`ps -ef | grep -v grep | grep -v $myname | grep $1 | grep java`		# search for the app. server by its name   
if [ $? == 1 ]; then						# if the above cmd does not produce an output 
	return 0						# then the app server does not exist	
fi
as_pid=`echo $as | awk '{print($2)}'` 				#get its PID
echo "Attempt1:killing server $as_pid"
kill -9 $as_pid


as=`ps -ef | grep -v grep | grep -v $myname | grep $1 | grep java`		# search for the app. server by its name   
if [ $? == 1 ]; then						# if the above cmd does not produce an output 
	return 0						# then the app server does not exist
fi
as_pid=`echo $as | awk '{print($2)}'` 				#get its PID
echo "Attempt2:killing command $as_pid"
kill -9 $as_pid

