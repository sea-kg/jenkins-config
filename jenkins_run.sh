#!/bin/bash

SCRIPT="$(readlink --canonicalize-existing "$0")"
SCRIPTPATH="$(dirname "$SCRIPT")"

# echo $SCRIPT
cd $SCRIPTPATH

export JAVA_OPTS=-Djava.awt.headless=true

java -jar jenkins-2.462.1.war --httpPort=82