# Vagrant

Arch
```
# Install libvirt

# Install vagrant and plugins
sudo pacman -Syu vagrant nfs-utils
vagrant plugin install vagrant-libvirt

systemctl start libvirtd
vagrant up --provider=libvirt
```

## Usage
Use vagrant to bring up a basic OS.   
Use ansible separately to provision the machines.   
I don't want to use vagrant + ansible intergation.   
The ansible scripts should be independent from vagrant.   
```bash
vagrant up
vagrant ssh-config > ssh.config
# Point ansible.cfg to above ssh.config
```

