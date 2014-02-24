#!/bin/bash

REPROPATH=`git rev-parse --show-toplevel`
echo 'PATH: '$REPROPATH
REPRO=`basename $REPROPATH`
echo 'REPRO: '$REPRO
TAGNAME="RELEASE_CANDIDATE"
BRANCHES=`git branch`
CURRENT_BRANCH=`echo $BRANCHES | grep \*`
BRANCHNAME=`echo $CURRENT_BRANCH | awk -F" " '{print $2}'`
echo 'BRANCH: '$BRANCHNAME
NOW=`date +"%Y-%m-%d %H:%M"`
FEATURE_BRANCH="\"feature_branch\": \""$BRANCHNAME"\""
RELEASE_DATE="\"release_date\": $NOW\""
JSON="{ $FEATURE_BRANCH,"
JSON=$JSON"$RELEASE_DATE,"
JSON=$JSON" \"released_to\": \"STAGE\" }"
echo $JSON
