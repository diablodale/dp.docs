# from https://hub.docker.com/_/ruby
FROM ruby:3.1.3

RUN apt update && \
    apt install build-essential && \
    gem install jekyll bundler

CMD tail -f /dev/null
