#!/usr/bin/env bash

# ssh into the only or specified container
docker-ssh() {
  # check if there is any args
  if [[ $# -gt 0 ]]; then
    # if so, use the first arg as the container id
    id=$1
  else
    # check if there are containers running
    if [[ $(docker ps | wc -l) -eq 1 ]]; then
      # if there is not, exit
      echo "There are no docker containers running. You should start one."
      return 1
    fi
    # check if there is more than one container running
    if [[ $(docker ps | wc -l) -gt 2 ]]; then
      # if there is, exit because we don't know which to use
      echo "There is more than one docker container running. Please specify one."
      return 1
    fi
    # grab the first container id
    id=$(docker ps | awk 'FNR == 2 {print $1}')
  fi

  # run bash in the container
  shell="/bin/sh"
  has_bash=$(docker exec -it "$id" ls /bin/bash)
  if [[ has_bash == "/bin/bash" ]]; then
    shell="/bin/bash"
  fi
  docker exec -it "$id" "$shell"
}
