#!/bin/bash

DIR=$(cd $(dirname $0); pwd);

export LOADTEST_URL=http://localhost:33370/datp/1.0/tx/start/example
export LOADTEST_CONNECTIONS=100
export LOADTEST_DURATION=20
# export LOADTEST_AMOUNT=100
export LOADTEST_RATE=100
export LOADTEST_LONGPOLL=Y

echo "$" node loadtest-tx.js
         node loadtest-tx.js
