#!/bin/bash

if test $# -lt 2
then
    echo "Invalid arguments of gen.sh"
    echo "should be:"
    echo "gen.sh <path/to/app.jar> <app.main.class> [target_directory]"
    exit 1
fi

targetDirectory="${3:-.}"

#copy app.jar
cp $1 $targetDirectory/

#copy dockerfile needed files
mkdir -p $targetDirectory/config
cp $PWD/app-generate-props.sh $targetDirectory/
cp $PWD/app-run.sh $targetDirectory/

sed '	
	s/%%APP_MAIN_CLASS%%/'"$2"'/g;
' Dockerfile.template > $targetDirectory/Dockerfile