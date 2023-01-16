#!/bin/bash
SCRIPTPATH=$(dirname $0)
#
NAME=ca
SUBJECT="/CN=KUBERNETES-CA" 
#
$SCRIPTPATH/gen_key.sh $NAME 
$SCRIPTPATH/gen_csr.sh $NAME "$SUBJECT"
$SCRIPTPATH/sign_ca_csr.sh $NAME 
