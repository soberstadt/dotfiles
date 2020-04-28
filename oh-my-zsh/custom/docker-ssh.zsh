#!/usr/bin/env bash

docker-ssh() {
  if [[ $# -gt 0 ]]; then
    docker exec -it "$@" /bin/bash
  else
    if [[ $(docker ps | wc -l) -eq 2 ]]; then
      docker exec -it "$(docker ps | awk 'FNR == 2 {print $1}')" /bin/bash
    else
      echo "There is not only one docker container running. Please specify one."
    fi
  fi
}
