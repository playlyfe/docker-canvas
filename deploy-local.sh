#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
sudo ansible-playbook -i $SCRIPT_DIR/ansible/inventory_lo $SCRIPT_DIR/ansible/playbooks/canvas/local.yml
