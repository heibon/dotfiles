#!/bin/sh

BIT_BASE="https://bitbucket.org/"
REPOS_NAME=`grep url .git/config | head -n 1 | sed 's|[^u]*url = git@bitbucket.org:\([^/]*/[^.]*\).git.*|\1|g'`
BRANCH_NAME="`git branch | grep '*' | awk '{ print $2 }'`"
MODE="$1"

if [ "${MODE}" == "help" -o "${MODE}" == "h" -o "${MODE}" == "-h" ];
then
    echo "Usage: ${0} [pr]"
    exit
fi

if [ "${BRANCH_NAME}" == "master" ];
then
    URL="${BIT_BASE}${REPOS_NAME}"
else
    URL="${BIT_BASE}${REPOS_NAME}/pull-request/new?source=${REPOS_NAME}::${BRANCH_NAME}"
fi

echo "Open ${MODE} mode ${URL}."
open "${URL}"
