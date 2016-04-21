docker-production() {
  docker-env "production"
}

docker-default() {
  docker-env "default"
}

docker-env() {
  eval $(docker-machine env $1 --shell=bash 2&>/dev/null| grep export)
  export PS1="docker $1 $__PS1"
}

docker-ssh() {
  ssh root@$(docker-machine ip $1) -i ~/.docker/machine/machines/$1/id_rsa
}
