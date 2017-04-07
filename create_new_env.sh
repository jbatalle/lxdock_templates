#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'No argument supplied'
    exit 1
fi
env_name=$1

#create folder
mkdir $env_name

cd $env_name

cat > lxdock.yml <<EOF
name: $env_name
image: ubuntu/xenial
hostnames:
  - $env_name
privileged: yes
shares:
  - source: /home/josep/workspace/test_lxc
    dest: /home/ubuntu/workspace
shell:
  user: ubuntu
  home: /home/ubuntu
EOF
