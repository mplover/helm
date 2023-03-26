FROM alpine
LABEL maintainer "Mark Plover <mydubrules@gmail.com>"

RUN apk update
RUN apk add curl openssl which git
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | sh

RUN helm plugin install https://github.com/chartmuseum/helm-push
