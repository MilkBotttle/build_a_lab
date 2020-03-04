#!/bin/bash
set -e

VAGRANT_RPM=/tmp/vagrant.rpm

# Install pip
if [ ! -x "$(command -v pip)" ];
then
    curl https://bootstrap.pypa.io/get-pip.py | python
fi

pip install ansible
ansible-playbook setup.yml
