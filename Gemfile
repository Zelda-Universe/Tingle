# frozen_string_literal: true

source "https://rubygems.org"

# Still relevant as `mysql` is still out-dated/-moded by Ruby 2/4
# Source: https://stackoverflow.com/a/41521197/1091943
gem 'mysql2'

gem 'standalone_migrations',
  git: 'https://github.com/pysis868/standalone-migrations/',
  branch: 'feature/add-db-dir-config-and-refactor'

group :development do
  gem 'pry'
  gem 'pry-byebug'
end
