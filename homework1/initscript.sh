#!/bin/sh
#setHostname
hostnamectl set-hostname centos

#ethernet.config;
IFCFG_PATH="/etc/sysconfig/network-scripts"

mv $IFCFG_PATH/ifcfg-enp0s3 $IFCFG_PATH/ifcfg-enp0s3.bk
grep -v '^ONBOOT' $IFCFG_PATH/ifcfg-enp0s3.bk > $IFCFG_PATH/ifcfg-enp0s3; echo ONBOOT=yes>>$IFCFG_PATH/ifcfg-enp0s3
if [[ $(wc -l $IFCFG_PATH/ifcfg-enp0s3 |cut -d ' ' -f 1) -ge '15' ]]; then rm -f $IFCFG_PATH/ifcfg-enp0s3.bk; fi

#apply network settings;
systemctl restart network


#disable created service;
systemctl stop VMInstall.service
systemctl disable VMInstall.service

#git
yum -y install git

#clone
rm -rf /tmp/MLMOS
git clone https://github.com/ac999/MLMOS.git /tmp/MLMOS
REP_PATH="/tmp/MLMOS/homework1"
chmod +x $REP_PATH/bootstrap.sh
sudo $REP_PATH/bootstrap.sh >> /var/log/system-bootstrap.log
