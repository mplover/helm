FROM centos
LABEL maintainer "Mark Plover <mydubrules@gmail.com>"

ARG VERSION

RUN yum install -y curl openssl which && \
    curl -L https://git.io/get_helm.sh | bash && \
    helm init --client-only

ENV HELM_HOME=/root/.helm

RUN yum install -y git && \
    helm plugin install https://github.com/chartmuseum/helm-push