source 'https://rubygems.org'

gem 'rails', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mongoid'
gem 'bson_ext'
gem 'figaro'
gem 'omniauth-twitter'
gem 'omniauth-facebook', '1.4.0'
gem 'active_model_serializers'
gem 'exifr'
gem 'geocoder'
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'
gem 'mini_magick'

gem 'jquery-rails'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do 
  gem 'rspec-rails', '~> 2.0'
  gem 'pry'
  gem 'pry-rails'
end

group :development do 
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'sextant'
  gem 'mailcatcher'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'mongoid-rspec'
  gem 'shoulda-matchers'
  gem 'forgery'
end