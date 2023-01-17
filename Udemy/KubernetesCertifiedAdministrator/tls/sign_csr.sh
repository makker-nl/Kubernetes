#!/bin/bash
SCRIPTPATH=$(dirname $0)
#
# See also https://stackoverflow.com/questions/66357451/why-does-signing-a-certificate-require-cacreateserial-argument
#
CA_KEY=$SCRIPTPATH/ca.key
CA_CRT=$SCRIPTPATH/ca.crt
CA_SRL=$SCRIPTPATH/ca.srl
CREATE_SRL="-CAserial $CA_SRL"
if [ ! -f "$CA_SRL" ]; 
then
  CREATE_SRL='-CAcreateserial';
fi
#
NAME=$1
CSR=$SCRIPTPATH/$NAME.csr
CRT=$SCRIPTPATH/$NAME.crt
#
echo Sign $CSR, using CA $CA_CRT and CAKey $CA_KEY, Create/Use SRL: $CREATE_SRL, resulting in $CRT
openssl x509 -req -in $CSR -CA $CA_CRT -CAkey $CA_KEY $CREATE_SRL -out $CRT
