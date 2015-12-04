clear-greenkeeper-branches() {
  for branch in $(git branch -a | grep greenkeeper- | sed 's/remotes\/origin\///g'); do
    git push origin :$branch
    git branch $branch -D
  done
}

clear-all-greenkeeper-stuff() {
  cd ~/Documents/src
  for repo in $(greenkeeper list | sed 's/JamesKyburz\///g'); do
    cd $repo
    gl
    clear-greenkeeper-branches
  done
}
