# you need to npm i -g hihat install-missing for this
hh() {
  if [ "$args" = "$mac" ]; then
    args="--frame"
  fi
  NPM_ARGS=-SE hihat index.js ${args} -- -p $(which install-missing)
}
