FROM python:2-stretch

RUN apt update && \
  apt-get -y install ca-certificates curl openssl tar gnupg bash postgresql-client mysql-client grep expect && \
  update-ca-certificates && \
  curl -sL https://storage.googleapis.com/kubernetes-release/release/v1.14.2/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && \
  chmod a+x /usr/local/bin/kubectl && \
  curl -sL https://github.com/shyiko/kubesec/releases/download/0.9.2/kubesec-0.9.2-linux-amd64 -o /usr/local/bin/kubesec && \
  chmod a+x /usr/local/bin/kubesec && \
  pip install awscli && \
  curl -sL https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 -o /usr/local/bin/jq && \
  chmod a+x /usr/local/bin/jq && \
  curl -sL https://github.com/mikefarah/yq/releases/download/2.2.1/yq_linux_amd64 -o /usr/local/bin/yq && \
  chmod a+x /usr/local/bin/yq && \
  curl -sL https://storage.googleapis.com/kubernetes-helm/helm-v2.14.2-linux-amd64.tar.gz -o helm.tar.gz && \
  tar xzf helm.tar.gz && \
  mv ./linux-amd64/helm /usr/local/bin/helm && \
  chmod a+x /usr/local/bin/helm && \
  curl -sL https://github.com/roboll/helmfile/releases/download/v0.45.3/helmfile_linux_amd64 -o /usr/local/bin/helmfile && \
  chmod a+x /usr/local/bin/helmfile && \
  curl -sL https://github.com/mozilla/sops/releases/download/3.2.0/sops-3.2.0.linux -o /usr/local/bin/sops && \
  chmod a+x /usr/local/bin/sops

COPY --from=quay.io/prometheus/prometheus:latest /bin/promtool /usr/local/bin/promtool
COPY ./*.sh /usr/local/bin/

