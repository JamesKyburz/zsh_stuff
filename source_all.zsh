source_it() {
  if [ "$1" != "all.zsh" ]; then
    source $1
  fi
}
for file in *.zsh; do source_it $file; done
