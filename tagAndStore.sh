#!/bin/bash

TAGNAME="RELEASE_CANDIDATE"
BRANCHNAME=`git branch | grep \* | awk -F" " '{print $2}'`
echo 'BRANCH: '$BRANCHNAME
NOW=`date +"%Y-%m-%d %H:%M"`
FEATURE_BRANCH="\"feature_branch\": \""$BRANCHNAME"\""
RELEASE_DATE="\"release_date\": $NOW\""
JSON="{ $FEATURE_BRANCH,"
JSON=$JSON"$RELEASE_DATE,"
JSON=$JSON" \"released_to\": \"STAGE\" }"
TIMESTAMP=`date +"%T"`
echo 'TS:'$TIMESTAMP
echo 'JSON: '$JSON
curl -X PUT -H "Content-Type: application/json" http://dcp-tools-01:5984/feature-db/$TIMESTAMP -d \'$JSON\'
