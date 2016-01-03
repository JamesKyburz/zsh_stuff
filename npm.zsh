new-release() {
  npm version patch && gp && gp --tags && npm publish
}
