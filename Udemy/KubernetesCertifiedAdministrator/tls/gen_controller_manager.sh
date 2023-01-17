#!/bin/bash
SCRIPTPATH=$(dirname $0)
#
NAME=controller-manager
SUBJECT="/CN=system:kube-controller-manager"
#
$SCRIPTPATH/gen_key.sh $NAME 
$SCRIPTPATH/gen_csr.sh $NAME "$SUBJECT"
$SCRIPTPATH/sign_csr.sh $NAME 
