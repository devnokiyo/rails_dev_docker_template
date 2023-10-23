FROM ruby:2.5.1
RUN echo "deb http://archive.debian.org/debian stretch main contrib non-free" > /etc/apt/sources.list
RUN apt-get update -qq && apt-get install -y build-essential default-libmysqlclient-dev nodejs

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod 744 /usr/local/bin/docker-entrypoint.sh

ENV READY_RAILS_DIR=/ready_rails
WORKDIR $READY_RAILS_DIR
COPY Gemfile .
COPY application.rb .
COPY database.yml .
COPY puma.rb .

WORKDIR /app
ENTRYPOINT ["docker-entrypoint.sh"]
