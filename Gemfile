source 'https://rubygems.org'

# global gems
gem 'rails', "~> 4.0.0.beta1"
gem 'jquery-rails'
gem 'mysql2'

# make passwords saferish
gem 'bcrypt-ruby'

# foriegn key support in dbs
gem 'schema_plus'

# set important things in environment variables, not config files
gem 'dotenv-rails'

# sensible templating
gem 'haml-rails'

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
  gem 'sass-rails',   "~> 4.0.0.beta1"
  gem 'coffee-rails', "~> 4.0.0.beta1"

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier'
end
