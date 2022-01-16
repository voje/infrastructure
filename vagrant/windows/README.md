# Vagrant on Windows
Using Virtualbox as the hypervisor (supports more out-of-the-box features than HyperV).

Ofc, Vagrant needs to be installed on Windows.   
Add the ansible plugin:
```ps1
$ vagrant plugin install vagrant-guest_ansible
```

```ps1
# Admin privileges shell
$ vagrant up
```
Use Default Switch (WSL DHCP didn't work for me).
