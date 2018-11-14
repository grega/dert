FROM ruby:2.5-alpine

RUN apk --no-cache --update add \
  build-base \
  libxml2-dev \
  libxslt-dev \
  postgresql-dev \
  tzdata \
  nodejs

RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app