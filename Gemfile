source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails', '~> 5.2.2'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'puma', '~> 3.11'
gem 'sassc'
gem 'sass-rails', '~> 5.0'
gem 'bootstrap', '~> 4.3.1'
gem 'font-awesome-sass', '~> 5.6.1'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'jquery-rails' 
gem 'jquery-ui-rails'
gem 'devise'
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'rails-i18n', '~> 5.1'
gem 'carrierwave'
gem 'fog-aws'
gem 'rmagick'
gem 'friendly_id'
gem 'gon'
gem 'kaminari'
gem 'ransack'
gem 'bcrypt', '~> 3.1.7'
gem 'ed25519'
gem 'bcrypt_pbkdf'
gem 'redis-rails'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'bullet'
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors'
  gem 'spring-commands-rspec'
  gem 'letter_opener'
  gem 'letter_opener_web'
end

group :production, :staging do
  gem 'unicorn'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
