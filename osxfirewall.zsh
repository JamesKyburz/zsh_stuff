restart-firewall() {
  sudo launchctl unload /System/Library/LaunchDaemons/com.apple.alf.agent.plist
  sudo launchctl load /System/Library/LaunchDaemons/com.apple.alf.agent.plist
}

enable-disable-firewall() {
  sudo defaults write /Library/Preferences/com.apple.alf globalstate -int $1
  restart-firewall
}

enable-firewall() {
  enable-disable-firewall 1
}

disable-firewall() {
  enable-disable-firewall 0
}
