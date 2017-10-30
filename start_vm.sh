#!/bin/bash
NODE_NAME="node-ldap"
docker-machine start $NODE_NAME
docker-machine regenerate-certs -f $NODE_NAME 
