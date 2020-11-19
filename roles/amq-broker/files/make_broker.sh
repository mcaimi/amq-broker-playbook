#!/bin/bash

ARTEMIS_HOME=${1}
BROKER_NAME=${2}
ADMIN_USER=${3}
ADMIN_PASS=${4}
BROKER_INSTANCE_PATH="$ARTEMIS_HOME/bin/$BROKER_NAME"

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
