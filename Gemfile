source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.3'

gem 'bcrypt'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'http'
gem 'jbuilder', '~> 2.7'
gem 'puma', '~> 4.1'
gem 'nokogiri', '~> 1.13', platforms: :ruby
gem 'rails', '~> 7.1.5', '>= 7.1.5.1'
gem 'faker'
gem 'will_paginate'
gem 'mail'
gem 'sprockets', '~> 4.2'
gem 'sprockets-rails', '~> 3.4'
gem 'sassc-rails'


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
  gem 'better_errors', '2.6'
  gem 'binding_of_caller'
  gem "draft_generators", git: "https://github.com/firstdraft/draft_generators"
  gem 'rails_db', '2.3.1'
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
