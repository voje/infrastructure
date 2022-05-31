# Bring up cluster
Manually for now

Bring up cluster using kubeadm and cri-dockerd as runtime:
```bash
sudo kubeadm config images pull --cri-socket unix:///run/cri-dockerd.sock
sudo kubeadm init --pod-network-cidr=10.10.0.0/16 --cri-socket unix:///run/cri-dockerd.sock
```

Untaint control-plane nodes:
```bash
k taint node master node-role.kubernetes.io/control-plane:NoSchedule-
k taint node master node-role.kubernetes.io/master:NoSchedule-
```

Run a test pod
```bash
k run --image=voje/toolbox:0.0.8 toolbox -- sleep inf
k get pods
```

## Install kubectl locally (on vagrant host)
From your host machine.   
```bash
ansible-playbook -i inventories/localhost playbooks/install_k8s/main.yaml --tags="prepare_user_client"

# Get the kubeconfig from vagrant and put it on your host machine
echo "export KUBECONFIG=~/.kube/vagrant.config" >> ~/.bashrc 
k get pods
```

# Other resources

## Example kubelet config
```yaml
root@master:/etc/kubernetes/manifests# cat /var/lib/kubelet/config.yaml 
apiVersion: kubelet.config.k8s.io/v1beta1
authentication:
  anonymous:
    enabled: false
  webhook:
    cacheTTL: 0s
    enabled: true
  x509:
    clientCAFile: /etc/kubernetes/pki/ca.crt
authorization:
  mode: Webhook
  webhook:
    cacheAuthorizedTTL: 0s
    cacheUnauthorizedTTL: 0s
cgroupDriver: systemd
clusterDNS:
- 10.96.0.10
clusterDomain: cluster.local
cpuManagerReconcilePeriod: 0s
evictionPressureTransitionPeriod: 0s
fileCheckFrequency: 0s
healthzBindAddress: 127.0.0.1
healthzPort: 10248
httpCheckFrequency: 0s
imageMinimumGCAge: 0s
kind: KubeletConfiguration
logging:
  flushFrequency: 0
  options:
    json:
      infoBufferSize: "0"
  verbosity: 0
memorySwap: {}
nodeStatusReportFrequency: 0s
nodeStatusUpdateFrequency: 0s
resolvConf: /run/systemd/resolve/resolv.conf
rotateCertificates: true
runtimeRequestTimeout: 0s
shutdownGracePeriod: 0s
shutdownGracePeriodCriticalPods: 0s
staticPodPath: /etc/kubernetes/manifests
streamingConnectionIdleTimeout: 0s
syncFrequency: 0s
volumeStatsAggPeriod: 0s
```