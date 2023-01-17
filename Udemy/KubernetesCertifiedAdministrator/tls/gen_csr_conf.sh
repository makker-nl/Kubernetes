#!/bin/bash
SCRIPTPATH=$(dirname $0)
#
NAME=$1
SUBJECT="$2"
KEY=$NAME.key
CSR=$NAME.csr
CONF=$NAME.cnf
#
echo Generate a CSR, for $NAME, using $KEY, $CONF and "$SUBJECT", resulting in $CSR
openssl req -new -key $KEY -subj \
"$SUBJECT" -out $CSR -config $CONF