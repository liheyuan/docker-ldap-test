#!/bin/bash
NODE_NAME="node-ldap"
VOLUME_DATA='/var/lib/boot2docker/docker_data/ldap/data'
VOLUME_CONFIG='/var/lib/boot2docker/docker_data/ldap/config'
docker-machine create -d virtualbox $NODE_NAME
# china mirror
docker-machine ssh $NODE_NAME "echo -e '{\n\"registry-mirrors\": [\t\"https://docker.mirrors.ustc.edu.cn\"]\n}' > ./daemon.json"
docker-machine ssh $NODE_NAME "sudo cp ./daemon.json /etc/docker/"
docker-machine restart $NODE_NAME
docker-machine regenerate-certs -f $NODE_NAME
# volume dir
docker-machine ssh $NODE_NAME "sudo mkdir -p $VOLUME_DATA"
docker-machine ssh $NODE_NAME "sudo chown -R docker:staff $VOLUME_DATA"
# volume dir
docker-machine ssh $NODE_NAME "sudo mkdir -p $VOLUME_CONFIG"
docker-machine ssh $NODE_NAME "sudo chown -R docker:staff $VOLUME_CONFIG"
