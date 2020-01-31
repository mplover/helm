FROM centos
LABEL maintainer "Mark Plover <mydubrules@gmail.com>"

RUN yum install -y curl openssl which && \
    curl -fsSL -o get_helm.sh https://git.io/get_helm.sh && \
    chmod u+x get_helm.sh && \
    ./get_helm.sh --version v2.15.1 && \
    helm init --client-only --home=/.helm && \
    chmod -R 777 /.helm

ENV HELM_HOME=/.helm

RUN yum install -y git && \
    helm plugin install https://github.com/chartmuseum/helm-push