#!/usr/bin/env bash

# ssh into the only or specified container
docker-ssh() {
  # check if there is any args
  if [[ $# -gt 0 ]]; then
    # if so, use the first arg as the container id
    id=$1
  else
    # otherwise, check if there is exactly one container running
    if [[ $(docker ps | wc -l) -ne 2 ]]; then
      # if there is not, exit because we don't know which to use
      echo "There is not only one docker container running. Please specify one."
      return 1
    fi
    # grab the first container id
    id=$(docker ps | awk 'FNR == 2 {print $1}')
  fi

  # run bash in the container
  docker exec -it "$id" /bin/bash
}
