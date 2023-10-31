#!/bin/bash
#
# Post Create Command for devcontainer.
# We can put multiple configs here that will be exectuted
# once container is created.
#

# Fail on error.
set -e

# Run npm install ( default - npm ci )
npm_rc=""
for I in $(seq 1 5) ; do
    npm ci
    npm_rc=""
    if [ "${npm_rc}" != "0" ] ; then
	continue
    else
	break
    fi
done
