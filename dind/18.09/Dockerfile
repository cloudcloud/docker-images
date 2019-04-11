FROM docker:18.09-dind

RUN apk --update add py-pip python-dev libffi-dev openssl-dev gcc libc-dev make curl && \
  curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
  chmod a+x /usr/local/bin/docker-compose

