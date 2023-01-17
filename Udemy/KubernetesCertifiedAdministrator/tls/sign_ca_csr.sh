#!/bin/bash
SCRIPTPATH=$(dirname $0)
#
CA_KEY=$SCRIPTPATH/ca.key
NAME=$1
CSR=$SCRIPTPATH/$NAME.csr
CRT=$SCRIPTPATH/$NAME.crt
#
echo Sign $CSR, using $CA_KEY, resulting in $CRT
openssl x509 -req -in $CSR -signkey $CA_KEY -out $CRT
