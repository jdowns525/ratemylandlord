source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.3'
gem 'rails', '~> 6.1.7'
gem 'puma', '~> 6.4'
gem 'rack', '~> 2.2'
gem 'bcrypt'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'http'
gem 'jbuilder', '~> 2.7'
gem 'nokogiri', '>= 1.10.8'
gem 'ruby-openai'
gem 'sassc-rails'
gem 'sprockets', '~> 4.2'
gem 'faker'
gem 'will_paginate', '~> 3.3'


group :development do
  gem 'htmlbeautifier'
  gem 'listen', '~> 3.2'
  gem 'rufo'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring'
  gem 'web-console', '>= 3.3.0'
end

group :development, :test do
  gem 'amazing_print'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails'
  gem 'grade_runner', github: 'firstdraft/grade_runner'
  gem 'pry-rails'
  gem 'sqlite3', '~> 1.4.1'
  gem 'table_print'
  gem 'web_git', github: 'firstdraft/web_git'
end

group :development do
  gem 'annotate'
  gem 'better_errors', '~> 2.6'
  gem 'binding_of_caller'
  gem 'draft_generators', github: 'firstdraft/draft_generators', branch: 'winter-2020'
  gem 'rails_db', '~> 2.3'
end

group :test do
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'rspec-html-matchers'
  gem 'rspec-rails'
  gem 'webmock'
end

group :production do
  gem 'pg'
end
