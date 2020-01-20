FROM centos
LABEL maintainer "Mark Plover <mydubrules@gmail.com>"

ARG VERSION

RUN curl -L https://git.io/get_helm.sh | bash