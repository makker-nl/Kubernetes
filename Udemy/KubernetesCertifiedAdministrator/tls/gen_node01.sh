#!/bin/bash
SCRIPTPATH=$(dirname $0)
#
NAME=node01
SUBJECT="/CN=system:node:$NAME/O=system:nodes"
#
$SCRIPTPATH/gen_key.sh $NAME 
$SCRIPTPATH/gen_csr.sh $NAME "$SUBJECT"
$SCRIPTPATH/sign_csr.sh $NAME 
