#!/bin/bash
SCRIPTPATH=$(dirname $0)
. $SCRIPTPATH/oci_env.sh
. $SCRIPTPATH/get_oci_creds.sh
ACD_CHART_NAME=argo-cd
#
# For downloading from GitHub: See
# * https://stackoverflow.com/questions/33066582/how-to-download-a-folder-from-github 
# * https://docs.github.com/en/rest/repos/contents?apiVersion=2022-11-28#get-archive-link
ACD_GITHUB_URL=https://codeload.github.com/argoproj/argo-helm/tar.gz/main
ACD_CHART_FOLDER=argo-helm-main/charts/argo-cd
ACD_CHART_HOME=$CHARTS_DIR/$ACD_CHART_NAME
echo Download $ACD_CHART_HOME Helm Chart into $ACD_CHART_HOME
curl $ACD_GITHUB_URL | \
tar -xz --directory $CHARTS_DIR --strip=2 $ACD_CHART_FOLDER
# Only grep version: where it is starting the line, using ^, ignoring the dependency version.
ACD_VERSION=$(grep '^version:' $ACD_CHART_HOME/Chart.yaml | cut -d ":" -f2 | xargs)
echo "Note: this chart relies on the chart redis-ha from repo https://dandydeveloper.github.io/charts/"
echo "There for perform helm dependency update $ACD_CHART_HOME:"
helm dependency update $ACD_CHART_HOME
echo Package $ACD_CHART_NAME version $ACD_VERSION in $ACD_CHART_HOME
helm package $ACD_CHART_HOME -d $CHARTS_DIR
echo Login to the helm registry:
helm registry login $OCIR_HOST -u $OCIR_TENANT/$OCI_USER_NAME -p "$OCI_USER_TOKEN"
echo Push the charts: 
helm push $CHARTS_DIR/$ACD_CHART_NAME-$ACD_VERSION.tgz $HELM_URL
echo Check the charts with:
echo helm show chart $HELM_URL/$ACD_CHART_NAME
helm show chart $HELM_URL/$ACD_CHART_NAME
echo "(or echo helm show all $HELM_URL/$ACD_CHART_NAME --version $ACD_VERSION)"
