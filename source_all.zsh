#!/usr/bin/env zsh

for file in *.zsh; do
  if [ "$file" != `basename $0` ]; then
    source $file;
  fi
done
