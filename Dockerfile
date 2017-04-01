FROM createkio/docker-ruby:2.3.3-slim

MAINTAINER CreatekIO

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 20 --retry 5
COPY . ./
RUN cd /app && bundle exec rake RAILS_ENV=production SECRET_KEY_BASE='ffaaccddee11223344' assets:precompile
