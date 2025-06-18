#!/usr/bin/env bash
set -o errexit

# Force a clean bundle environment
bundle config set force_ruby_platform true
bundle install --without development test

# Explicitly clear assets and rebuild them
bundle exec rake assets:clobber
bundle exec rake assets:precompile

# Migrate DB explicitly (safety measure)
bundle exec rake db:migrate
