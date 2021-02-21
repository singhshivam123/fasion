# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'rails', '~> 6.0.3', '>= 6.0.3.1'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'devise'
gem 'haml-rails'
gem 'jbuilder', '~> 2.7'
gem 'jquery-rails'
gem 'kaminari'

# gem 'mysql2'
gem 'pg'
gem 'puma', '~> 4.1'

# attr_encrypted
gem 'attr_encrypted', '~> 3.1.0'

# Active Admin
gem 'activeadmin'

# pdf generator
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'

# for slug
gem 'friendly_id', '~> 5.2.4'

# Best In Place
gem 'best_in_place', '~> 3.0.1'

group :assets do
  gem 'coffee-rails'
  gem 'sass-rails', '>= 6'
  gem 'uglifier', '>=1.0.3'
end

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'letter_opener'
  gem 'listen', '~> 3.2'

  gem 'brakeman'

  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rails_config'

  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'mocha', group: :test
