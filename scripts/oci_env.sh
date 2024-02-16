#!/bin/bash
echo Set OCI and Helm variables
export GIT_BASE_DIR=$(git rev-parse --show-toplevel)
export TENANT_NAME=your_tenant
export OCIR_HOST=your_region.ocir.io
export OCIR_TENANT=your_tenant_id
export OCIR_URL=oci://$OCIR_HOST/$OCIR_TENANT
export DEVOPS_PROJECT=your_project
export GIT_REPO=your-repo
export DEVOPS_HOST=devops.scmservice.your_region.oci.oraclecloud.com
export GIT_URL=https://$DEVOPS_HOST/namespaces/$OCIR_TENANT/projects/$DEVOPS_PROJECT/repositories/$GIT_REPO
export HELM_URL=$OCIR_URL/helmcharts
export CHARTS_SRC_DIR=$GIT_BASE_DIR/charts
export CHARTS_DIR=$GIT_BASE_DIR/charts_nocommit
