source 'https://rubygems.org'


gem 'rails', '4.2.5.2'
gem 'rails-api'
gem 'active_model_serializers'
gem 'devise'
gem 'rack-cors', require: 'rack/cors'
gem 'faker'

group :development do
  gem 'thin'
end

group :development, :test do
  gem 'sqlite3'
  gem 'pry-rails'
end

group :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers', '2.8'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'simplecov', require: false
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
  gem 'rails_stdout_logging'
  gem 'rails_serve_static_assets'
end