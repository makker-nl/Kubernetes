#!/bin/bash
SCRIPTPATH=$(dirname $0)
#
NAME=$1
SUBJECT="$2"
KEY=$SCRIPTPATH/$NAME.key
CSR=$SCRIPTPATH/$NAME.csr
#
echo Generate a CSR, for $NAME, using $KEY and "$SUBJECT", resulting in $CSR
openssl req -new -key $KEY -subj "$SUBJECT" -out $CSR
