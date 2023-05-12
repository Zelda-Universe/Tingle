# frozen_string_literal: true

source "https://rubygems.org"

# git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }
# git_source(:github) {|repo_name| "https://github.com/#{repo_name}.git" }

# TODO: Unable to use updated fork+branch with default schema syntax error rm fix, so just install manually for now:
# Source: https://github.com/thuss/standalone-migrations/issues/169#issuecomment-1492516629
gem 'standalone_migrations'
# gem 'standalone-migrations', git: 'https://github.com/mlarraz/standalone-migrations', branch: 'rm_schema_default'
# gem 'standalone-migrations', github: 'mlarraz/standalone-migrations', branch: 'rm_schema_default'

# Still relevant as `mysql` is still out-dated/-moded by Ruby 2/4
# Source: https://stackoverflow.com/a/41521197/1091943
gem 'mysql2'

group :development do
  gem 'pry-byebug'
  # gem 'pry-byebug', require: true
end
