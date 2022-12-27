#!/bin/sh

echo "Please provide your build name in SemVer format (ex. 0.2.3,1.2.0-dev):"

read buildname

echo "Please provide your build version (ex. 10,11,12):"

read buildversion

flutter build appbundle --build-name $buildname --build-number $buildversion