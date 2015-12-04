new-mac() {
  sudo /System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -z
  current=$(ifconfig en0 | grep ether | awk '{print $2}')
  mac=$(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')
  sudo ifconfig en0 ether $mac
  networksetup -detectnewhardware
  check=$(ifconfig en0 | grep ether | awk '{print $2}')
  if [ "$check" = "$mac" ]; then
    echo "changed mac address from $current to $mac"
  else
    echo "error changed mac address"
  fi
}
