#!/bin/bash
SCRIPTPATH=$(dirname $0)
#
NAME=$1
CRT=$SCRIPTPATH/$NAME.crt
#
echo View $CRT
openssl x509 -in $CRT -text -noout
