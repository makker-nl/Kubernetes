#!/bin/bash
kubectl get ns --no-headers -o custom-columns=":metadata.name"
