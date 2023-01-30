#!/bin/bash
SCRIPTPATH=$(dirname $0)
GIT_URL=https://github.com
WEAVE_GIT_URL="$GIT_URL/weaveworks/weave"
WEAVE_REL_URL="$WEAVE_GIT_URL/releases"
echo "Weave Releases at: $WEAVE_REL_URL"
export WEAVE_TAG="weaveworks/weave/releases/tag/"
# Get first occurence of the WEAVE_TAG
WEAVE_VER=$(curl -Ls $WEAVE_REL_URL/latest |grep $WEAVE_TAG -m 1)
# Remove everything upto the WEAVE_TAG
WEAVE_VER=${WEAVE_VER#*$WEAVE_TAG}
# Remove everyting after the first occurence of the double-quote
WEAVE_VER=${WEAVE_VER%%\"*}
# Echo Result
echo Weave Version: $WEAVE_VER
export WEAVE_YAML_TAG=weave-daemonset-k8s-
# Get the first occurence of the WEAVE_YAML_TAG on the expanded_assests of the WEAVE_VER version
WEAVE_YAML_URL=$(curl -Ls "$WEAVE_REL_URL/expanded_assets/$WEAVE_VER" |grep $WEAVE_YAML_TAG -m 1)
# Strip upto the first double-quote
WEAVE_YAML_URL=${WEAVE_YAML_URL#*\"}
# Strip after the following double quote:
WEAVE_YAML_URL=${WEAVE_YAML_URL%%\"*}
# Add the GIT URL in front: 
WEAVE_YAML_URL="$GIT_URL/${WEAVE_YAML_URL}"
# Echo the result:
echo Latest Weave Deamon Set YAML: $WEAVE_YAML_URL
echo Install latest Weave version $WEAVE_VER from $WEAVE_YAML_URL:
wget -q $WEAVE_YAML_URL --output-document - | kubectl apply -f -
