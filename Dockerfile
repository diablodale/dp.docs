# from https://hub.docker.com/_/ruby
FROM ruby:3.1.3

RUN apt update && \
    apt install build-essential && \
    gem install jekyll bundler

# jekyll new --skip-bundle .
# do initial edit of Gemfile
# bundle install
# bundle add webrick
# bundle exec jekyll serve

COPY Gemfile Gemfile.lock /docs/
RUN umask 000 && \
    cd /docs && \
    bundle install

CMD tail -f /dev/null
