#!/bin/bash
set -e

BASEDIR=$(dirname $0)
VENV=$BASEDIR/venv
VAGRANT_RPM=/tmp/vagrant.rpm

yum install qemu libvirt libvirt-devel ruby-devel gcc qemu-kvm make automake gcc gcc-c++ kernel-devel python-devel libvirt-devel -y

# Install pip
curl https://bootstrap.pypa.io/get-pip.py | python

pip install virtualenv
virtualenv $VENV
source $VENV/bin/activate

pip install ansible
pip install vbmc
pip install libvirt-python lxml selinux



# Install vagrant
curl -o https://releases.hashicorp.com/vagrant/2.2.7/vagrant_2.2.7_x86_64.rpm $VAGRANT_RPM
yum install -y $VAGRANT_RPM

vagrant plugin install vagrant-libvirt

echo export VAGRANT_DEFAULT_PROVIDER=libvirt >> ~/.bashrc
source ~/.bashrc

set +e
ssh-keygen -q -N ""
set -e
