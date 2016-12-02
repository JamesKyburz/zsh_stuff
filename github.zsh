github-create() {
  repo_name=$1
  invalid_credentials=0

  dir_name=`basename $(pwd)`

  if [ "$repo_name" = "" ]; then
    echo "Repo name (hit enter to use '$dir_name')?"
    read repo_name
  fi

  if [ "$repo_name" = "" ]; then
    repo_name=$dir_name
  fi

  username=`git config github.user`
  if [ "$username" = "" ]; then
    echo "Could not find username, run 'git config --global github.user <username>'"
    invalid_credentials=1
  fi

  token=`git config github.token`
  if [ "$token" = "" ]; then
    echo "Could not find token, run 'git config --global github.token <token>'"
    invalid_credentials=1
  fi

  if [ "$invalid_credentials" = "0" ]; then
    echo -n "Creating Github repository '$repo_name' ..."
    curl -u "$username:$token" https://api.github.com/user/repos -d '{"name":"'$repo_name'"}' > /dev/null 2>&1
    echo " done."

    echo -n "Pushing local code to remote ..."
    git remote add origin git@github.com:$username/$repo_name.git > /dev/null 2>&1
    git push -u origin master > /dev/null 2>&1
    echo " done."
  fi
}

# you need to npm i -g create-files pkginit for this
create-os-project() {
  project=$1
  if [ "$project" = "" ]; then
    read project\?"project name? "
  fi

  if [ "$project" != "" ]; then
    mkdir -p $project
    cd $project
    git init
    github-create
    pkginit
    create-files
    mkdir -p test
    npm i
    echo "start coding!"
  fi
}

function gist() {
  local url=""

  # if there's nothing piped on STDIN
  if [ -t 0 ]; then
    # and there's no arguments...
    if ((! $# )); then
      # take what's onthe clipboard and paste it in a new gist
      command gist -Pcop -f paste.txt
    else
      # create a gist based on the arguments give
      command gist -cop $@
    fi
  else
    # otherwise, create a gist, with arguments, but use the
    # content from STDIN
    command gist -cop $@ < /dev/stdin
  fi
}
