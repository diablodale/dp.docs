# from https://hub.docker.com/_/ruby
FROM ruby:3.1.3

RUN apt update && \
    apt install build-essential && \
    gem install jekyll bundler

RUN umask 000

# jekyll new --skip-bundle .
# do initial edit of Gemfile
# bundle install
# bundle add webrick

CMD tail -f /dev/null
