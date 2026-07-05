#!/bin/bash

ls | grep -v 'todo' | grep -v 'transfer_nvim_config' | xargs -I {} cp -R {} ~/.config/nvim/
if [[ $? == 0 ]]; then
  echo 'successfully copied files to nvim config'
else
  echo 'ERROR: Failed to copy files to nvim config'
fi
