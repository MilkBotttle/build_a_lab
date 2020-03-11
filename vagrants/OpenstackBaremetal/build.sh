#!/bin/bash
echo Start deploy node
vagrant up
echo Start empty node
ansible-playbook empty.yml
