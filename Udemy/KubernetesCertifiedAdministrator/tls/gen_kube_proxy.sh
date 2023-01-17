#!/bin/bash
SCRIPTPATH=$(dirname $0)
#
NAME=kube-proxy
SUBJECT="/CN=system:kube-proxy"
#
$SCRIPTPATH/gen_key.sh $NAME 
$SCRIPTPATH/gen_csr.sh $NAME "$SUBJECT"
$SCRIPTPATH/sign_csr.sh $NAME 
