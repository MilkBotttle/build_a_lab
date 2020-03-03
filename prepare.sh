#!/bin/bash
set -e

BASEDIR=$(dirname $0)
VENV=$BASEDIR/venv
VAGRANT_RPM=/tmp/vagrant.rpm

yum install qemu libvirt libvirt-devel ruby-devel gcc qemu-kvm make automake gcc gcc-c++ kernel-devel python-devel libvirt-devel -y

systemctl start libvirtd
systemctl enable libvirtd

# Install pip
curl https://bootstrap.pypa.io/get-pip.py | python

pip install virtualenv
virtualenv $VENV
source $VENV/bin/activate

pip install ansible lxml selinux libvirt-python==5.0.0 virtualbmc==1.4.0

# Install vagrant
curl https://releases.hashicorp.com/vagrant/2.2.7/vagrant_2.2.7_x86_64.rpm -o $VAGRANT_RPM
yum install -y $VAGRANT_RPM

vagrant plugin install vagrant-libvirt

echo export VAGRANT_DEFAULT_PROVIDER=libvirt >> ~/.bashrc
source ~/.bashrc

set +e
echo "Generate ssh key, if exist won't create ..."
cat /dev/zero | ssh-keygen -q -N "" > /dev/null
set -e
