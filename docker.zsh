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
  export PS1="docker $1 $__PS1"
}

docker-ssh() {
  ssh root@$(docker-machine ip $1) -i ~/.docker/machine/machines/$1/id_rsa
}
