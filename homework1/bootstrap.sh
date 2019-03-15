#!/bin/sh
echo --------------------------------
echo bootstrap.sh >> /var/log/system-bootstrap.log
date >> /var/log/system-bootstrap.log
echo --------------------------------


#update apps;
echo "updater" >> /var/log/system-bootstrap.log
yum -y update >> /var/log/system-bootstrap.log

#SSH CONFIG
echo "ssh config" >> /var/log/system-bootstrap.log
if [[ $(find /root/.ssh | wc -l) -ne 1 ]]; then
	mkdir /root/.ssh;
	echo "created /root/.ssh" >> /var/log/system-bootstrap.log
fi

SCF_PATH="/tmp/MLMOS/homework1/sshd_cfg"
PUB_KEY=$SCF_PATH/id_mlmos.pub
SSH_PATH="/etc/ssh"

cp $PUB_KEY /root/.ssh/ >> /var/log/system-bootstrap.log
cp $SSH_PATH/sshd_config $SSH_PATH/sshd_config.bk >> /var/log/system-bootstrap.log
rm -f $SSH_PATH/sshd_config >> /var/log/system-bootstrap.log
cp $SCF_PATH/sshd_config $SSH_PATH/sshd_config >> /var/log/system-bootstrap.log
systemctl restart sshd >> /var/log/system-bootstrap.log

#SELINUX
SEL_PATH="/etc/selinux"
if [[ $(grep 'SELINUX=enforcing' $SEL_PATH/config | wc -l) -ne 0 ]]; then
	mv $SEL_PATH/config $SEL_PATH/config.bk; grep -v '^SELINUX=enforcing' > $SEL_PATH/config.bk $SEL_PATH/config; echo SELINUX=disabled >> $SEL_PATH/config;
fi
setenforce 0 >> /var/log/system-bootstrap.log
