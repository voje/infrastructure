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

