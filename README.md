# Infrastructure

Vagrant files, ansible roles.

## k8s
```bash
cd vagrant/k8s
vagrant ssh-config > ssh.config
```

```bash
cd ansible
# make sure ansible.cfg uses the right ssh.config
ansible-playbook -i inventory playbooks/install_k8s.yaml
```
