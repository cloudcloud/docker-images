
FROM driftrock/heroku-cli:latest AS base

RUN heroku update

RUN apt-get update && apt-get install -y apt-transport-https curl software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian jessie stable"

RUN apt-get update && apt-get install -y postgresql docker-ce && \
    apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

