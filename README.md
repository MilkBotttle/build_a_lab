# build_a_lab
This is for CentOS

# Quick Start
* Install dependencies and create a virtualenv save python library.
```
bash prepare.sh
```
Setup Env
Create proxyvm service for ssh, and create virt-net for vm.
```
source venv/bin/activate
ansible-playbook setup.yml
```

# Vagrant up
```
cp -r vagrants/OpenStack ~
cd ~/OpenStack
vagrant up
```
After vm create complete you can use those vm to deploy

# How to use vbmc for baremetal service
If use virtaulenv don't forget source environment.

* Create port
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
on hypervisor or vm 192.168.122.1 is KVM host default ip
```
ipmitool -U USERNAME -P PASSWORD -H 192.168.122.1 -I lanplus -p PORT power status
```
* firewall config
```
firewall-cmd --permanent --zone=public --add-port=623-627/udp
firewall-cmd --reload
```



