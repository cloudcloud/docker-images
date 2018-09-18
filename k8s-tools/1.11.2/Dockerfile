FROM python:2-alpine

# For details around the reasoning behind the symbolic link with musl, please see:
# https://stackoverflow.com/questions/34729748/installed-go-binary-not-found-in-path-on-alpine-linux-docker/35613430

RUN apk update && \
  apk add --no-cache ca-certificates curl openssl tar gnupg bash postgresql-client mysql-client grep busybox-extras xz && \
  update-ca-certificates && \
  curl -sL https://storage.googleapis.com/kubernetes-release/release/v1.11.2/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && \
  chmod a+x /usr/local/bin/kubectl && \
  mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2 && \
  curl -sL https://github.com/shyiko/kubesec/releases/download/0.6.1/kubesec-0.6.1-linux-amd64 -o /usr/local/bin/kubesec && \
  chmod a+x /usr/local/bin/kubesec && \
  pip install awscli && \
  curl -sL https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 -o /usr/local/bin/jq && \
  chmod a+x /usr/local/bin/jq && \
  curl -sL https://github.com/mikefarah/yq/releases/download/1.15.0/yq_linux_amd64 -o /usr/local/bin/yq && \
  chmod a+x /usr/local/bin/yq && \
  curl -sL https://storage.googleapis.com/kubernetes-helm/helm-v2.9.1-linux-amd64.tar.gz -o helm.tar.gz && \
  tar xzf helm.tar.gz && \
  mv ./linux-amd64/helm /usr/local/bin/helm && \
  chmod a+x /usr/local/bin/helm && \
  curl -sL https://github.com/roboll/helmfile/releases/download/v0.20.0/helmfile_linux_amd64 -o /usr/local/bin/helmfile && \
  chmod a+x /usr/local/bin/helmfile

COPY --from=quay.io/prometheus/prometheus:latest /bin/promtool /usr/local/bin/promtool
COPY ./*.sh /usr/local/bin/

