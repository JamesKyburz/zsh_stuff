add-travis-saucelabs-keys() {
  token=`git config github.token`
  travis login --github-token=$token
  travisify
  travis enable
  travis encrypt SAUCE_USERNAME=$1 --add
  travis encrypt SAUCE_ACCESS_KEY=$2 --add
}
