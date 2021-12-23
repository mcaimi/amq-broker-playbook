#!/bin/bash

ARTEMIS_HOME=${1}
INSTANCE_PATH=${2}
BROKER_NAME=${3}
ADMIN_USER=${4}
ADMIN_PASS=${5}
BROKER_INSTANCE_PATH="$INSTANCE_PATH/$BROKER_NAME"

# bail out if broker path already exists:
if [[ -d $BROKER_INSTANCE_PATH ]]; then
  echo -n ALREADY_EXISTS
  exit 0
fi

# create broker
$ARTEMIS_HOME/bin/artemis create $BROKER_INSTANCE_PATH --user $ADMIN_USER --password $ADMIN_PASS --require-login
if [[ $? -ne 0 ]]; then
  echo -n ERROR
  exit 1
fi

# done
echo -n CREATED
exit 0
