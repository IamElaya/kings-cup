# A sample Gemfile
ruby '2.1.3'
source "https://rubygems.org"

gem 'rake'
gem 'activesupport'

gem 'sinatra'
gem 'sinatra-contrib'
gem 'sinatra-activerecord'

gem 'puma'
gem 'tux'

group :development, :test do
  gem 'pry'
  gem 'shotgun'
  gem 'sqlite3'
end

group :test do
  gem 'rspec'
  gem 'database_cleaner'
end

group :production do
  gem 'pg'
end