source 'https://rubygems.org'

gem 'rails', '4.2.0'
gem 'rails-api'
gem 'pg'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'devise'
gem 'puma'
gem 'pry-rails'
gem 'pry-nav'
gem 'rack-cors', :require => 'rack/cors'

group :production do
  gem 'skylight'
  gem 'rails_12factor'
end

group :development do
  gem 'spring'
  gem 'rails-erd'
  gem 'rubocop', require: false
end

gem 'active_model_serializers'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'rspec-collection_matchers'
  gem 'factory_girl_rails'
  gem 'ffaker'
end

group :test do
  gem 'rspec-rails', '~> 2.14'
  gem 'shoulda-matchers'
end


# To use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano', :group => :development

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
