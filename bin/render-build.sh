#!/usr/bin/env bash
# exit on error
set -o errexit

# Force Nokogiri to build from source to avoid GLIBC issues on Render
bundle config set force_ruby_platform true

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate
