FROM debian:latest

RUN export DEBIAN_FRONTEND=noninteractive ; apt-get update && apt-get -y install docker.io curl unzip groff jq; \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"; \
    unzip awscliv2.zip; \
    ./aws/install; \
    rm awscliv2.zip

COPY /tanzu-cli-binary-archives/1.3.1/* /root/    

WORKDIR /root/

RUN tar xvf tanzu-cli-bundle-v1.3.1-linux-amd64.tar ;\
    gzip -d kubectl-linux-v1.20.5-vmware.1.gz ;\
    chmod ugo+x kubectl-linux-v1.20.5-vmware.1 ;\
    install kubectl-linux-v1.20.5-vmware.1 /usr/local/bin/kubectl ;\
    install cli/core/v1.3.1/tanzu-core-linux_amd64 /usr/local/bin/tanzu ;\
    tanzu plugin install --local cli all ;\
    gunzip cli/ytt-linux-amd64-v0.31.0+vmware.1.gz ;\
    chmod ugo+x cli/ytt-linux-amd64-v0.31.0+vmware.1 ;\
    mv cli/ytt-linux-amd64-v0.31.0+vmware.1 /usr/local/bin/ytt ;\
    gunzip cli/kapp-linux-amd64-v0.36.0+vmware.1.gz ;\
    chmod ugo+x cli/kapp-linux-amd64-v0.36.0+vmware.1 ;\
    mv cli/kapp-linux-amd64-v0.36.0+vmware.1 /usr/local/bin/kapp ;\
    gunzip cli/kbld-linux-amd64-v0.28.0+vmware.1.gz ;\
    chmod ugo+x cli/kbld-linux-amd64-v0.28.0+vmware.1 ;\
    mv cli/kbld-linux-amd64-v0.28.0+vmware.1 /usr/local/bin/kbld ;\
    gunzip cli/imgpkg-linux-amd64-v0.5.0+vmware.1.gz ;\
    chmod ugo+x cli/imgpkg-linux-amd64-v0.5.0+vmware.1 ;\
    mv cli/imgpkg-linux-amd64-v0.5.0+vmware.1 /usr/local/bin/imgpkg
       
