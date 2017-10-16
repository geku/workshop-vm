
KUBECTL_VERSION="v1.7.8"
MINIKUBE_VERSION="v0.22.3"
ETCD_VER=v3.2.9

apt-get install -y  jq

if /usr/bin/kubectl version --client | grep "GitVersion:\"$KUBECTL_VERSION\""; then
    echo "kubectl client $KUBECTL_VERSION is already installed. done"
else
    echo downloading https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl
    wget -q -O /usr/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl
    chmod +x /usr/bin/kubectl
fi


if /usr/bin/minikube version | grep "minikube version: $MINIKUBE_VERSION"; then
    echo "minikube $MINIKUBE_VERSION is already installed. done"
else
    echo downloading https://storage.googleapis.com/minikube/releases/${MINIKUBE_VERSION}/minikube-linux-amd64
    wget -q -O /usr/bin/minikube https://storage.googleapis.com/minikube/releases/${MINIKUBE_VERSION}/minikube-linux-amd64
    chmod +x /usr/bin/minikube
fi

if /usr/bin/minikube version | grep "minikube version: $MINIKUBE_VERSION"; then
    echo "minikube $MINIKUBE_VERSION is already installed. done"
else
    echo downloading https://storage.googleapis.com/minikube/releases/${MINIKUBE_VERSION}/minikube-linux-amd64
    wget -q -O /usr/bin/minikube https://storage.googleapis.com/minikube/releases/${MINIKUBE_VERSION}/minikube-linux-amd64
    chmod +x /usr/bin/minikube
fi

if /usr/bin/etcdctl --version | grep "etcdctl version:"; then
    echo "etcd $ETCD_VER is already installed. done"
else
    echo downloading https://storage.googleapis.com/etcd/${ETCD_VER}/etcd-${ETCD_VER}-linux-amd64.tar.gz
    wget -q -O /tmp/etcd-linux-amd64.tar.gz https://storage.googleapis.com/etcd/${ETCD_VER}/etcd-${ETCD_VER}-linux-amd64.tar.gz
    mkdir /tmp/etcd
    tar xzvf /tmp/etcd-linux-amd64.tar.gz -C /tmp/etcd --strip-components=1
    cp /tmp/etcd/{etcd,etcdctl} /usr/bin/
    chown root:root /usr/bin/{etcd,etcdctl}
fi
