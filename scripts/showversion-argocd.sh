#!/bin/bash
SCRIPTPATH=$(dirname $0)
. $SCRIPTPATH/oci_env.sh
. $SCRIPTPATH/get_oci_creds.sh
#
ACD_CHART_NAME=argo-cd
ACD_GITHUB_URL=https://raw.githubusercontent.com/argoproj/argo-helm/main/charts/$ACD_CHART_NAME
ACD_GIT_VERSION=$(curl -s $ACD_GITHUB_URL/Chart.yaml | grep '^version:' | cut -d ":" -f2 | xargs)
echo Latest version of ArgoCD chart is: $ACD_GIT_VERSION
ACD_CUR_VERSION=$(helm show chart $HELM_URL/$ACD_CHART_NAME | grep '^version:' | cut -d ":" -f2 | xargs)
echo Current version of ArgoCD chart is: $ACD_CUR_VERSION

if [[ "$ACD_CUR_VERSION" == "$ACD_GIT_VERSION" ]]; then
  echo "Current OCIR version $ACD_CUR_VERSION matches GitHub version $ACD_GIT_VERSION. No need to upgrade."
else
  echo "Current OCIR version $ACD_CUR_VERSION differs from GitHub version $ACD_GIT_VERSION. May consider to upgrade."
fi
