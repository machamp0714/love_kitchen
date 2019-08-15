# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.3"

gem "bcrypt", "~> 3.1.7"
gem "bcrypt_pbkdf"
gem "bootsnap", ">= 1.1.0", require: false
gem "bootstrap", "~> 4.3.1"
gem "carrierwave"
gem "coffee-rails", "~> 4.2"
gem "devise"
gem "devise-i18n"
gem "devise-i18n-views"
gem "ed25519"
gem "fog-aws"
gem "font-awesome-sass", "~> 5.6.1"
gem "friendly_id"
gem "gon"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "jquery-ui-rails"
gem "kaminari"
gem "mysql2", ">= 0.4.4", "< 0.6.0"
gem "omniauth"
gem "omniauth-twitter"
gem "puma", "~> 3.11"
gem "rails", "~> 5.2.2"
gem "rails-i18n", "~> 5.1"
gem "ransack"
gem "redis-rails"
gem "rmagick"
gem "sass-rails", "~> 5.0"
gem "sassc"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

group :development, :test do
  gem "bullet"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capistrano"
  gem "capistrano-bundler"
  gem "capistrano-rails"
  gem "capistrano-rbenv"
  gem "factory_bot_rails"
  gem "rspec-rails"
end

group :development do
  gem "better_errors"
  gem "letter_opener"
  gem "letter_opener_web"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "pry-byebug"
  gem "rubocop", require: false
  gem "rubocop-rails"
  gem "rubocop-github"
  gem "spring"
  gem "spring-commands-rspec"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :production, :staging do
  gem "unicorn"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
