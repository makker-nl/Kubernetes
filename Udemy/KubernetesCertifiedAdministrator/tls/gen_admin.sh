#!/bin/bash
SCRIPTPATH=$(dirname $0)
#
NAME=admin
SUBJECT="/CN=kube-admin/O=system:masters"
#
$SCRIPTPATH/gen_key.sh $NAME 
$SCRIPTPATH/gen_csr.sh $NAME "$SUBJECT"
$SCRIPTPATH/sign_csr.sh $NAME 
