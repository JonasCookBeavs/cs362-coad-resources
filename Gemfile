source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.4.8"

gem 'airbrake', '~> 13.0.3'
gem 'bootsnap', '~> 1.18.0', require: false
gem 'bootstrap', '~> 4.4.1'
gem 'devise', '~> 4.9'
gem 'haml', '~> 6.3'
gem 'haml-rails', '~> 2.1.0'
gem 'jbuilder', '~> 2.11'
gem 'jquery-rails', '~> 4.6'
gem 'pagy', '~> 9.0.0'
gem 'phony_rails', '~> 0.15.0'
gem 'puma', '~> 6.0'
gem 'rails', '~> 7.1.0'
gem 'recaptcha', '~> 5.16', require: 'recaptcha/rails'
gem 'sassc-rails', '~> 2.1.2'
gem 'sqlite3', '~> 2.1'
gem 'turbolinks', '~> 5.2.1'
gem 'net-http', '~> 0.4.0'

group :development, :test do
  gem 'byebug', '~> 11.1.3', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails', '~> 3.1'
  gem 'factory_bot_rails', '~> 6.4.0'
  gem 'rspec-rails', '~> 7.0'
end

group :development do
  gem 'guard-rspec', '~> 4.7.3', require: false
  gem 'letter_opener', '~> 1.10'
  gem 'web-console', '~> 4.2'
end

group :test do
  gem 'capybara', '~> 3.40'
  gem 'database_cleaner', '~> 2.0.1'
  gem 'selenium-webdriver', '~> 4.18'
  gem 'shoulda-matchers', '~> 6.0'
  gem 'simplecov', '~> 0.22.0', require: false
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
