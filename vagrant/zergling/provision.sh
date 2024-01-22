#!/bin/bash

sudo apt-get update
sudo apt-get install -y ansible
ansible-galaxy role install geerlingguy.docker

cat >docker.yml<<EOF
- hosts: 127.0.0.1
  become: true
  roles:
    - geerlingguy.docker
EOF
ansible-playbook docker.yml

sudo usermod -aG docker vagrant
