#!/bin/bash
SCRIPTPATH=$(dirname $0)
#
NAME=apiserver
SUBJECT="//CN=kube-apiserver"
#
$SCRIPTPATH/gen_key.sh $NAME 
$SCRIPTPATH/gen_csr_conf.sh $NAME "$SUBJECT"
$SCRIPTPATH/sign_csr.sh $NAME