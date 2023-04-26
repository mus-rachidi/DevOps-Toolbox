#!/bin/bash
for container_id in $(docker ps -q)
do
  echo "Logs for container $container_id:"
  docker logs $container_id
done

