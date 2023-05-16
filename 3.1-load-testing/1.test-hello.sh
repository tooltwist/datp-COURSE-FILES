#!/bin/bash

DIR=$(cd $(dirname $0); pwd);

export LOADTEST_URL=http://localhost:33370/myProject/1.0/hello/Fred
export LOADTEST_CONNECTIONS=100
export LOADTEST_DURATION=10
#export LOADTEST_AMOUNT=100000

echo "$" node loadtest-hello.js
         node loadtest-hello.js
