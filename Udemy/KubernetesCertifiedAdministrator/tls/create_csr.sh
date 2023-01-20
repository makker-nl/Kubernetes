#!/bin/bash
SCRIPTPATH=$(dirname $0)
#
NAME=$1
CSR=$SCRIPTPATH/$NAME.csr
#
echo Create CSR Object for  $CSR
cat <<EOF | kubectl apply -f -
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: $NAME
spec:
  request: $(cat akshay.csr | base64 | tr -d '\n')
  signerName: kubernetes.io/kube-apiserver-client
  usages:
  - digital signature
  - key encipherment
  - server auth
EOF
