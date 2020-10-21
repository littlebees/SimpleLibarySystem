#!/bin/sh

# exit when any command fails
set -e

echo "generating config/secrets.yml"
cat << END > config/secrets.yml
development:
    secret_key_base: "$(rake secret)"
END
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
