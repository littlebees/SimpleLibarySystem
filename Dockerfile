FROM ruby:2.7.2-alpine AS setup_env
MAINTAINER fengzheng <fengzheng@me.com>
#RUN apt update && apt-get install -y build-essential nodejs imagemagick libmariadbclient-dev
RUN apk update && apk upgrade && apk add --update --no-cache build-base nodejs imagemagick mariadb-dev

FROM setup_env AS install_gems
RUN mkdir /app
WORKDIR /app
COPY Gemfile* /app/
RUN bundle install

FROM install_gems
COPY . /app
WORKDIR /app
# The connection was reset
CMD rails s --binding 0.0.0.0
