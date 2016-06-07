export __PS1=$PS1

docker-production() {
  docker-env "production"
}

docker-default() {
  docker-env "default"
}

docker-env() {
  export DOCKER_CERT_PATH=~/.docker/machine/machines/$1
  export DOCKER_HOST=$(docker-machine url $1)
  export DOCKER_MACHINE_NAME=$1
  export DOCKER_TLS_VERIFY=0
  test=$(docker ps 2>&1)
  if [ $? != 0 ]; then
    api_version=$(echo $test | sed s'/.*server API version: \(.*\))/\1/')
    export DOCKER_API_VERSION=$api_version
  fi
  export PS1="docker $1 $__PS1"
}

docker-unenv() {
  eval $(export | grep DOCKER | sed s'/^\(DOCKER[A-Z_]*\).*$/unset \1/g')
  export PS1="$__PS1"
}

docker-ssh() {
  ssh root@$(docker-machine ip $1) -i ~/.docker/machine/machines/$1/id_rsa
}
