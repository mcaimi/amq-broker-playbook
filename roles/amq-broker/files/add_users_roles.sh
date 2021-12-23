#!/bin/bash

ARTEMIS_INSTANCE_HOME=${1}
USER=${2}
PASS=${3}
ROLE=${4}
ADMIN_USER=${5}
ADMIN_PASS=${6}

# add users and roles
$ARTEMIS_INSTANCE_HOME/bin/artemis user add --user-command-user $USER --user-command-password $PASS --role $ROLE --user $ADMIN_USER --pass $ADMIN_PASS 2>&1 > /dev/null
if [[ $? -ne 0 ]]; then
  echo -n ALREADY_EXISTS
  exit 0
fi

# done
echo -n CREATED
exit 0
