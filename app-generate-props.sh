#!/bin/bash

for VAR in `env`
do
	if [[ $VAR =~ ^APP_.*_PROPS_ ]]; then
		propFile=`echo "$VAR" | sed 's/APP_\(.*\)_PROPS_.*/\1/' | tr '[:upper:]' '[:lower:]' | tr _ .`
		propKey=`echo "$VAR" | sed 's/APP_.*_PROPS_\(.*\)=.*/\1/' | tr '[:upper:]' '[:lower:]' | tr _ .`
		propValue=`echo "$VAR" | sed 's/APP_.*_PROPS_.*=\(.*\)/\1/'`
		
		echo "$propKey=$propValue" >> $APP_HOME/config/$propFile.properties
	fi
done