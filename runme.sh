#!/bin/bash

./setup.sh
ansible-playbook --ask-become-pass --connection=local workstation-setup.yml
