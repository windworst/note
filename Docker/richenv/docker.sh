#!/bin/sh
ssh-keygen -A
mkdir /var/run/sshd/
/usr/sbin/sshd -D -e $* &
dockerd ${DOCKERD_OPT}