source 'https://rubygems.org'
ruby '2.2.2'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.2'
gem 'rails-i18n', '~> 4.0.4'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
# gem 'sdoc', '~> 0.4.0', group: :doc
# For hypertext edit on active admin
gem 'active_admin_editor', github: 'boontdustie/active_admin_editor'
# For image uploader
gem 'carrierwave'
gem 'fog', require: 'fog/aws/storage'
# For dynamic meta tags
gem 'metamagic'
# For better enumerations
gem 'enumerate_it'
# For beautiful masked inputs
gem 'maskedinput-rails'
# To organize JS files
gem 'initjs', '~> 2.1.2'
# Support for SLIM files
gem 'slim-rails', '~> 3.0.1'
gem 'devise', '~> 3.5.1'
gem 'devise-i18n'
# For administrative interface
gem 'activeadmin', github: 'gregbell/active_admin'
# Well...simple forms
gem 'simple_form', '~> 3.1.0'
# Handle authorizations
gem 'pundit', '~> 1.0.0'
gem 'autoprefixer-rails'
gem 'bootstrap-sass', '~> 3.3.3'
gem 'font-awesome-rails'
gem 'nprogress-rails'
gem 'rack-zippy', '~> 3.0.0'
# Payment gateway
gem 'iugu', '~> 1.0.8'
# Format/Parse decimal numbers
gem 'accountingjs-rails'
# Calculate business days of the offers
gem 'business_time'
# Send assets to S3 instead of serving through Heroku
gem 'asset_sync', github: 'rumblelabs/asset_sync'

group :development do
  gem 'letter_opener'
end

group :development, :test do
  gem 'machinist', '~> 2.0'
  gem 'rspec-rails', '~> 3.3.2'
  gem 'awesome_print', '~> 1.6.1', require: false
  gem 'spring-commands-rspec', '~> 1.0.4'
  gem 'thin', '~> 1.6.3'
  gem 'pry-rails'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'dotenv-rails'
end

group :test do
  gem 'simplecov', '~> 0.10.0', require: false
  gem 'codeclimate-test-reporter', require: false
  gem 'database_cleaner', '~> 1.4.1'
  gem 'shoulda-matchers', '~> 2.8.0', require: false
  gem 'capybara'
  gem 'selenium-webdriver'
end

group :production do
  gem 'rails_12factor', '~> 0.0.3'
  gem 'passenger', '~> 5.0'
  gem 'newrelic_rpm'
end
