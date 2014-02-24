#!/bin/bash

TAGNAME="RELEASE_CANDIDATE"
BRANCHNAME=`git branch | grep \* | awk -F" " '{print $2}'`
NOW=`date +"%Y-%m-%d %H:%M"`
FEATURE_BRANCH="\"feature_branch\": \"$BRANCHNAME\""
RELEASE_DATE="\"release_date\": \"$NOW\""
JSON="{ $FEATURE_BRANCH,"
JSON=$JSON"$RELEASE_DATE,"
JSON=$JSON"\"released_to\": \"STAGE\" }"
TIMESTAMP=`date +"%s"`
curl -X PUT -H "Content-Type: application/json" -d "$JSON" http://dcp-tools-01:5984/feature-db/$TIMESTAMP
