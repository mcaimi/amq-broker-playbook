#!/bin/bash

ARTEMIS_INSTANCE_HOME=${1}
USER=${2}
PASS=${3}
ROLE=${4}

# add users and roles
$ARTEMIS_INSTANCE_HOME/bin/artemis user add --user $USER --password $PASS --role $ROLE 2>&1 > /dev/null
if [[ $? -ne 0 ]]; then
  echo -n ALREADY_EXISTS
  exit 0
fi

# done
echo -n CREATED
exit 0
