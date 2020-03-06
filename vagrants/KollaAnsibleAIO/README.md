# All in One kolla-ansible vagrantfile
Create a server for kolla ansible and deploy a all-in-one pure
openstack stein

# VM spec
## network interfaces
* eth0: vagrant management network: vagrant-libvirt, cidr 192.168.122.0/24
* eth1: private network for openstack internal api: use isolate network, cidr 192.168.33.0/24, used range 192.168.33.2~254
* eth2: public network for openstack use external network: use bridge br-inwinstack

## storage
* virtio disk 100GB wirteback unsafe
## memory
* 16GB
