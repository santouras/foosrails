source 'https://rubygems.org'

# global gems
gem 'rails', '3.2.13'
gem 'jquery-rails'
gem 'mysql2'

# make passwords saferish
gem 'bcrypt-ruby'

# foriegn key support in dbs
gem 'schema_plus'

# rails 4 strong params
gem 'strong_parameters'

# set important things in environment variables, not config files
gem 'dotenv-rails'

# gems used just for testing
group :test do
  gem 'capybara'
  gem 'factory_girl_rails'
end

group :development do

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
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end
