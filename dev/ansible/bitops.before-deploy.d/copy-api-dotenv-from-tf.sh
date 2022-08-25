#!/bin/bash


TF_DOTENV_FILE="$ENVROOT/terraform/api.env"
echo "check for api.env in tf: $TF_DOTENV_FILE"
if [ -f "$TF_DOTENV_FILE" ]; then
  echo "  tf api.env service found"

  echo "copy to ansible"
  cp "$TF_DOTENV_FILE" "$ANSIBLE_ROOT/.env"

  echo "check existence"
  ls -al "$ANSIBLE_ROOT"
else
  echo "  tf api.env service not found"
fi