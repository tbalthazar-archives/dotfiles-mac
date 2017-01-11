#!/bin/bash

source ~/.bash_aliases
source ~/.bash_exports
source ~/.bash_options
source ~/.bash_paths
source ~/.bash_prompt
source ~/.bash_colors

if [ -e ~/.bash_profile.private ]; then
  source ~/.bash_profile.private
fi
