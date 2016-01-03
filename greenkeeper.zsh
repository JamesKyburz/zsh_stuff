clear-greenkeeper-branches() {
  for branch in $(git branch -a | grep greenkeeper- | sed 's/remotes\/origin\///g'); do
    git push origin :$branch
    git branch $branch -D
  done
}

clear-all-greenkeeper-stuff() {
  cd ~/Documents/src
  user=$(git config --get user.username)
  for repo in $(greenkeeper list | sed 's/$user\///g'); do
    cd $repo
    gl
    clear-greenkeeper-branches
  done
}

merge-greenkeeper() {
  remotebranch=$(git branch --all | grep greenkeeper | head -n1 | sed 's/[ ]//g')
  localbranch=$(echo $remotebranch | cut -d "/" -f3)
  if [ "$remotebranch" = "" ]; then
    echo "no greenkeeper branch found"
    return
  fi
  git co -b $localbranch $remotebranch
  git diff master
  read merge\?"merge $localbranch? "
  if [ "$merge" = "y" ]; then
    git rebase master
    git co master
    git merge --no-ff $localbranch
  else
    git co master
  fi
}
