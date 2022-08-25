#!/bin/bash
echo "BitOps before script: Waiting for inventory hosts..."
python $ROOT_DIR/_scripts/ansible/wait-for-inventory-hosts.py