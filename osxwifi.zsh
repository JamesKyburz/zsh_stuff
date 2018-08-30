wifi-restart() {
  sudo networksetup -setairportpower en0 off
  sleep 1
  sudo networksetup -setairportpower en0 on
}
