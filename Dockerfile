FROM ruby:2.7
USER root

COPY rdjson_formatter.rb /opt/
COPY run-reviewdog.sh /opt/

RUN mkdir ~/.ssh && touch ~/.ssh/known_hosts
RUN apt-get update -y && apt-get install -y curl rubygems
RUN curl -sfL https://raw.githubusercontent.com/reviewdog/nightly/master/install.sh | sh -s -- -b /usr/bin
RUN gem install standard rubocop-rails
