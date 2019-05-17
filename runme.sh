#!/bin/bash

./setup.sh
ansible-playbook --ask-become-pass workstation-setup.yml
