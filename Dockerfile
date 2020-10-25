FROM centos
LABEL maintainer "Mark Plover <mydubrules@gmail.com>"

RUN yum install -y curl openssl which && \
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 && \
    chmod u+x get_helm.sh && \
    ./get_helm.sh --version v3.3.4

RUN yum install -y git && \
    helm plugin install https://github.com/chartmuseum/helm-push