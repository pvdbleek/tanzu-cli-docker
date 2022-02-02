FROM debian:latest

RUN export DEBIAN_FRONTEND=noninteractive ; apt-get update && apt-get -y install docker.io curl unzip groff jq; \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"; \
    unzip awscliv2.zip; \
    ./aws/install; \
    rm awscliv2.zip

COPY /tanzu-cli-binary-archives/0.10.0/* /root/    

WORKDIR /root/

RUN mkdir -p /root/tanzu-cluster-essentials ;\
    tar zxvf tanzu-cluster-essentials-linux-amd64-1.0.0.tgz -C /root/tanzu-cluster-essentials ;\
    cp /root/tanzu-cluster-essentials/kapp /usr/local/bin/kapp ;\
    mkdir /root/tanzu ;\
    tar -xvf tanzu-framework-linux-amd64.tar -C /root/tanzu ;\
    export TANZU_CLI_NO_INIT=true ;\
    install /root/tanzu/cli/core/v0.10.0/tanzu-core-linux_amd64 /usr/local/bin/tanzu ;\
    cd /root/tanzu; tanzu plugin install --local cli all

ENV TANZU_CLI_NO_INIT=true