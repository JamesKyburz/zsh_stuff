#!/usr/bin/env zsh
#

DIR=$(dirname $0)

for file in $DIR/*.zsh; do
  if [ "$file" != "$0" ]; then
    source $file;
  fi
done
