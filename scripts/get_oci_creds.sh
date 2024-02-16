#!/bin/bash
# SCRIPTPATH=$(dirname $0)
#
# Validate the OCI credentials and if not set, ask for them.
# @author: Martien van den Akker, Oracle Consulting.
#
echo Check OCI User name and Token
if [ -z "${OCI_USER_NAME}" ]; then
    read -p 'OCI Username: ' OCI_USER_NAME
    export OCI_USER_NAME
else
    echo "OCI_USER_NAME is set to $OCI_USER_NAME"
fi
if [ -z "${OCI_USER_TOKEN}" ]; then
    read -sp 'OCI User Token: ' OCI_USER_TOKEN
    export OCI_USER_TOKEN
else
    echo "OCI_USER_TOKEN is already set."
fi
