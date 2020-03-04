# Build a Lab
This is for CentOS.
Create a environment for multiple vm running create by vagrant.

# Quick Start
Install vagrant, pip, ansible, libvirt.
```
bash -x prepare.sh
```

# Vagrant up
```
cp -r vagrants/OpenStack ~
cd ~/OpenStack
vagrant up
```
After vm create complete you can use those vm to deploy

# How to use vbmc for baremetal service

* Create port
VMDOMAIN: vm name
USERNAME: default admin
PASSWORD: default password
PORT: use a empty port
```
vbmc add VMDOMAIN --username USERNAME --password PASSWORD --port PORT
```
* list port
```
vbmc list
```
* start port
```
vbmc start VMDOMAIN
```
* delete port
```
vbmc delete VMDOMAIN
```
* check port enable
```
lsof -Pni:[PORTA-PORTB]
```
* test vbmc
on hypervisor or vm, the 192.168.122.1 is KVM host default ip
```
ipmitool -U USERNAME -P PASSWORD -H 192.168.122.1 -I lanplus -p PORT power status
```
* firewall config
```
firewall-cmd --permanent --zone=public --add-port=[PORTA-PORTB]/udp
firewall-cmd --reload
```



