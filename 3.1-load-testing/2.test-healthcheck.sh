#!/bin/bash

DIR=$(cd $(dirname $0); pwd);

export LOADTEST_URL=http://localhost:33370/datp/1.0/healthcheck
export LOADTEST_CONNECTIONS=100
export LOADTEST_DURATION=10
#export LOADTEST_AMOUNT=2000

echo "$" node loadtest-healthcheck.js
         node loadtest-healthcheck.js
