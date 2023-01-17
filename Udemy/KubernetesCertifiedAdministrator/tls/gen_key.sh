#!/bin/bash
SCRIPTPATH=$(dirname $0)
#
NAME=$1
KEY=$SCRIPTPATH/$NAME.key
echo Generate a key for $NAME, resulting in $KEY
openssl genrsa -out $KEY 2048
