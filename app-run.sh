#!/bin/bash

$APP_HOME/app-generate-props.sh

java -cp $APP_HOME/config/:/$APP_HOME/app.jar $APP_MAIN_CLASS $*