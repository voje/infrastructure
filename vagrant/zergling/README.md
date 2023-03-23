# Zergling
Quick Virtualbox VM. Tested on Windows with Virtualbox.   

## Run vagrant from WSL, use Virtualbox on Windows
https://thedatabaseme.de/2022/02/20/vagrant-up-running-vagrant-under-wsl2/

Vagrant works fine algouth connecting is not pleasant.   
Virtualbox starts listening on 127.0.0.1; we need to manually set network 
adapter to "Connected adapter", which gives our VM an IP on our local network.   

Then we need to change the ssh key permissions because windows adds 777 to the 
key.   

sigh...

## HyperV on Windows
(old)
Using Virtualbox as the hypervisor since supports more out-of-the-box features than HyperV.

```ps1
# Admin privileges shell or click OK a few times.
$ vagrant up
```
Use Default Switch (WSL DHCP didn't work for me).

## Libvirt on Linux
Make sure you're using up-to-date `vagrant` and 
up-to-date `vagrant-libvirt` package.   

https://vagrant-libvirt.github.io/vagrant-libvirt/installation.html



