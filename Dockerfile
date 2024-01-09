FROM alpine:3.19

ENV HELM_VERSION v3.7.1

RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
 && apk update \
 && apk add --no-cache openssl bash ca-certificates yq \
 && wget -q https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz \
 && tar -zxvf helm-${HELM_VERSION}-linux-amd64.tar.gz \
 && mv linux-amd64/helm /usr/local/bin/helm \
 && rm -rf linux-amd64 helm-${HELM_VERSION}-linux-amd64.tar.gz \
 && helm repo add stable https://charts.helm.sh/stable \
 && helm repo update

CMD helm
