#!/bin/bash

abspath=$(cd ${0%/*} && echo $PWD/${0##*/})
setup_dir=`dirname "$abspath"`

echo
echo ---------------------- Installing Galaxy requirements ----------------------
GALAXY=$(ansible-galaxy install -v -r $setup_dir/requirements.yml -p $setup_dir/roles 2>&1)

if (echo $GALAXY | grep "NOT installed successfully" > /dev/null)
then
    echo "$GALAXY"
    exit 1
fi

if (echo $GALAXY | grep "use --force to change version" > /dev/null)
then
    echo
    echo -- Forcing galaxy upgrades due to version changes
    echo
    ansible-galaxy install --force -r $setup_dir/requirements.yml -p $setup_dir/roles
fi

echo
