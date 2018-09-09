#!/bin/bash

set -e

if [ ! -e Gemfile ]; then
  cp -a $READY_RAILS_DIR/Gemfile .
  touch Gemfile.lock

  bundle install
  rails new . -d mysql -f

  cp -a $READY_RAILS_DIR/database.yml \
    $READY_RAILS_DIR/puma.rb \
    $READY_RAILS_DIR/application.rb config/
  mkdir -p tmp/sockets

  rm -r $READY_RAILS_DIR

  until rails db:drop &> /dev/null; do
    >&2 echo "MySQL is unavailable - sleeping"
    sleep 1
  done

  rails db:create

elif [ -e $READY_RAILS_DIR ]; then
  bundle install
  rm -r $READY_RAILS_DIR
fi

exec "$@"
