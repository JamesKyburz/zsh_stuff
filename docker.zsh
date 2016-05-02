docker-production() {
  docker-env "production"
}

docker-default() {
  docker-env "default"
}

docker-env() {
  export DOCKER_CERT_PATH=~/.docker/machine/machines/$1
  export DOCKER_HOST=tcp://$(docker-machine ip $1)
  export DOCKER_MACHINE_NAME=$1
  export DOCKER_TLS_VERIFY=0
}

docker-ssh() {
  ssh root@$(docker-machine ip $1) -i ~/.docker/machine/machines/$1/id_rsa
}
