#!/bin/bash

DIR=$(cd $(dirname $0); pwd);

export LOADTEST_URL=http://localhost:33370/datp/1.0/tx/start/null
export LOADTEST_CONNECTIONS=100
export LOADTEST_DURATION=10
#export LOADTEST_AMOUNT=1000
export LOADTEST_LONGPOLL=N

echo "$" node loadtest-tx.js
         node loadtest-tx.js
