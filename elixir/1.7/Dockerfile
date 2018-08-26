
FROM elixir:1.7-slim

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl apt-transport-https gnupg && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install -y git inotify-tools build-essential mysql-client postgresql nodejs yarn

RUN mix local.hex --force && \
    mix local.rebar --force && \
    yes | mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez

