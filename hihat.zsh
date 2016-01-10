# you need to npm i -g hihat install-missing for this
hhb() {
  NPM_ARGS=-SE hihat --frame 800,800 $1 shift -- -p $(which install-missing) $*
}

hhn() {
  NPM_ARGS=-SE hihat --node $*
}
