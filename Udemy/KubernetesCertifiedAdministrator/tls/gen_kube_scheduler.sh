#!/bin/bash
SCRIPTPATH=$(dirname $0)
#
NAME=scheduler
SUBJECT="/CN=system:kube-scheduler"
#
$SCRIPTPATH/gen_key.sh $NAME 
$SCRIPTPATH/gen_csr.sh $NAME "$SUBJECT"
$SCRIPTPATH/sign_csr.sh $NAME 
