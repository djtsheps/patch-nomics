# frozen_string_literal: true

source "https://rubygems.org"

# Specify your gem's dependencies in patch-nomics.gemspec
gemspec

gem 'rake', '~> 13.0'

group :development do
  gem 'pry', :require => false
  gem 'rubocop', '~> 1.21'
end

group :test do
  gem 'minitest', '~> 5.0'
  gem 'minitest-vcr'
  gem 'webmock'
end

