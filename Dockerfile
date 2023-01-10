# from https://hub.docker.com/_/ruby
FROM ruby:3.1.3

RUN apt update && \
    apt install build-essential && \
    gem install bundler

# jekyll new --skip-bundle .
# do initial edit of Gemfile
# cd into docs then onetime do: bundle exec just-the-docs rake search:init
# bundle exec jekyll serve

COPY Gemfile Gemfile.lock /dp.docs/
RUN umask 002 && \
    cd /dp.docs && \
    bundle install

CMD tail -f /dev/null
