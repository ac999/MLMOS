#!/bin/sh


#update apps;
yum -y update

#SSH CONFIG
if [[ $(find /root/.ssh | wc -l) -ne 1 ]]; then
	mkdir /root/.ssh;
fi

SCF_PATH="/tmp/MLMOS/homework1/sshd_cfg"
PUB_KEY=$SCF_PATH/id_mlmos.pub
SSH_PATH="/etc/ssh"

cp $PUB_KEY /root/.ssh/
cp $SSH_PATH/sshd_config $SSH_PATH/sshd_config.bk
rm -f $SSH_PATH/sshd_config
cp $SCF_PATH/sshd_config $SSH_PATH/sshd_config

#SELINUX
SEL_PATH="/etc/selinux"
if [[ $(grep 'SELINUX=enforcing' $SEL_PATH/config | wc -l) -ne 0 ]]; then
	mv $SEL_PATH/config $SEL_PATH/config.bk; grep -v '^SELINUX=enforcing' > $SEL_PATH/config.bk $SEL_PATH/config; echo SELINUX=disabled >> $SEL_PATH/config;
fi
setenforce 0
