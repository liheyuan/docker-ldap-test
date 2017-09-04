#!/bin/bash
NODE_NAME="node-ldap"
DOCKER_NAME="sbmvt-ldap"
VOLUME_DATA='/var/lib/boot2docker/docker_data/ldap/data'
VOLUME_CONFIG='/var/lib/boot2docker/docker_data/ldap/config'
eval $(docker-machine env $NODE_NAME)
last_id=$(docker ps -l -q)
docker rm -f $last_id
docker run --volume "$VOLUME_DATA":/var/lib/ldap --volume "$VOLUME_CONFIG":/etc/ldap/slapd.d -p389:389 -p636:636 --env LDAP_TLS=false --env LDAP_DOMAIN=coder4.com --detach osixia/openldap:1.1.9
