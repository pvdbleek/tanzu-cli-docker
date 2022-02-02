FROM debian:latest

RUN export DEBIAN_FRONTEND=noninteractive ; apt-get update && apt-get -y install docker.io curl sudo unzip groff jq; \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"; \
    unzip awscliv2.zip; \
    ./aws/install; \
    rm awscliv2.zip

WORKDIR /root/

RUN curl -H "Accept: application/vnd.github.v3.raw" \
    -L https://api.github.com/repos/vmware-tanzu/community-edition/contents/hack/get-tce-release.sh | \
    bash -s v0.9.1 linux ;\
    tar xzvf tce-linux-amd64-v0.9.1.tar.gz ;\
    cd tce-linux-amd64-v0.9.1 ;\
    export ALLOW_INSTALL_AS_ROOT=true ;\
    ./install.sh ;\
    curl -LO https://dl.k8s.io/release/v1.20.1/bin/linux/amd64/kubectl ;\
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl ;\