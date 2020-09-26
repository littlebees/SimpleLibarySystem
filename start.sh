#!/bin/sh

# exit when any command fails
set -e

echo "install ruby-2.4.0"
rvm install "ruby-2.4.0"
echo "use ruby-2.4.0"
rvm use ruby-2.4.0
echo "generating config/secrets.yml"
cat << END > config/secrets.yml
development:
    secret_key_base: $(rake secret)
END
echo "rails s"
rails s
echo "bundle install"
bundle install
echo "rake db:create"
rake db:create
echo "rake db:migrate"
rake db:migrate
echo "rake db:seed"
rake db:seed
echo "rails g devise:install"
rails g devise:install

