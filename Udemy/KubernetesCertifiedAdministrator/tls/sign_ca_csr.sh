#!/bin/bash
SCRIPTPATH=$(dirname $0)
#
CA_KEY=ca.key
NAME=$1
CSR=$NAME.csr
CRT=$NAME.crt
#
echo Sign $CSR, using $CA_KEY, resulting in $CRT
openssl x509 -req -in $CSR -signkey $CA_KEY -out $CRT
