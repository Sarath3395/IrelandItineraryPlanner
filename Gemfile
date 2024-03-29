source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'


gem 'geocoder'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.1'
# Use sqlite3 as the database for Active Record

#Security Gems
gem 'rails_admin'
gem 'brakeman'
gem 'devise'
gem 'omniauth-google-oauth2'
gem 'omniauth-facebook'
gem "recaptcha", require: "recaptcha/rails"
gem 'figaro'

gem 'favouriteshandler'
gem 'chartdecorator'
gem 'numbered_logs_decorator'
gem 'recommendationforuser'
gem 'recommendation_strategy'

gem 'prawn'

gem 'chartkick'
gem 'groupdate'
gem 'rails-observers'

gem 'figaro'


group :development, :test do
gem 'sqlite3'
end



gem 'recommendationforuser'
gem 'rails-observers'

gem 'nokogiri'
gem 'watir'
gem 'bookingscrapper'
gem 'transportscrapper'
gem 'restaurantscrapper'
gem 'tripdecorator'


gem "font-awesome-rails"
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'
# Heroku uses Heroku Postgres DB based on PostgreSQL

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', '< 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
group :test do
  gem 'minitest-reporters'
end
group :test do
  gem 'rails-controller-testing'

end

# Heroku uses Heroku Postgres DB based on PostgreSQL
group :production do
gem 'pg'
gem 'rails_12factor'
end
