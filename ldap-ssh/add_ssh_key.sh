#!/bin/bash -x
ssh-keygen -t rsa -b 4096 -C "" -N "" -f ./key
docker exec ldap-ssh_main_1 mkdir -p /root/.ssh/
docker cp key.pub ldap-ssh_main_1:/root/.ssh/authorized_keys
docker exec ldap-ssh_main_1 chmod 600 /root/.ssh/authorized_keys
docker exec ldap-ssh_main_1 chmod 700 /root/.ssh/
docker exec ldap-ssh_main_1 chown root:root /root/.ssh/authorized_keys
docker exec ldap-ssh_main_1 passwd -u root

ssh root@localhost -p 20022 -i ./key
