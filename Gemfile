source 'https://rubygems.org'

# global gems
gem 'rails', "~> 4.0.2"
gem 'jquery-rails'
gem 'mysql2'

# make passwords saferish
gem 'bcrypt-ruby', '3.1.2'

# set important things in environment variables, not config files
gem 'dotenv-rails'

# sensible templating
gem 'haml-rails'

# bootstrap for templatng (for the moment)
gem 'bootstrap-sass'

# paginate activerecord queries
gem 'will_paginate'

# gems used just for testing
group :test do
  gem 'capybara'
  gem 'factory_girl_rails'
end

group :development do
  # better errors is better
  gem 'better_errors'

  # this lets us use the REPL part of better errors
  gem 'binding_of_caller'
end

group :development, :test do
  # love pry
  gem 'pry'
  gem 'pry-rails'

  # rspec testing framework
  gem 'rspec-rails'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   "~> 4.0.0"
  gem 'coffee-rails', "~> 4.0.0"

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier'
end
