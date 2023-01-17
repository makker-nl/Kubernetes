#!/bin/bash
SCRIPTPATH=$(dirname $0)
#
NODE=node01
NAME="kubelet-$NODE"
SUBJECT="/CN=system:node:$NODE/O=system:nodes"
#
$SCRIPTPATH/gen_key.sh $NAME 
$SCRIPTPATH/gen_csr.sh $NAME "$SUBJECT"
$SCRIPTPATH/sign_csr.sh $NAME 
