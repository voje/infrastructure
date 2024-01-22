# Zergling
Quick Virtualbox VM. Tested on Windows with Virtualbox.   

## HyperV on Windows
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

## Quickly install docker
```bash
sudo apt-get update
sudo apt-get install -y ansible
ansible-galaxy role install geerlingguy.docker
cat docker.yml<<EOF
- hosts: 127.0.0.1
  become: true
  roles:
    - geerlingguy.docker
EOF
ansible-playbook docker.yml
sudo usermod -aG docker $USER
```

