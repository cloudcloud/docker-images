
# heroku

An image for the Heroku CLI.

## example

For a basic invocation to run the ``help`` command

    docker run --rm -it -e HEROKU_API_KEY=$HEROKU_API_KEY --workdir=/app cloudcloud/heroku-cli:latest "help"

## example.sh

Place the following in file, ``chmod a+x`` it, then call the command as if it were installed locally

    #!/bin/bash
    docker run --rm -it -e HEROKU_API_KEY=$HEROKU_API_KEY -v $(pwd)/:/app/ --workdir=/app cloudcloud/heroku-cli:latest "$@"

If named ``/usr/bin/heroku`` would be called with

    heroku help

## docker

This image will also include both ``postgresql`` and ``docker``, primarily to facilitate use of the built-in database management capabilities for Postgres (via ``psql``) and generating docker images outside this container but being able to push them to the Heroku registry.

