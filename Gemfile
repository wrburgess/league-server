source 'https://rubygems.org'

# core
ruby '1.9.3'
gem 'rails', '3.2.8'

# plugins
gem 'devise', '~> 2.1.2'
gem 'haml-rails'
gem 'jquery-rails'
gem 'pg'

#asset-specific
group :assets do
  gem 'sass-rails', '~> 3.2.3'
  gem 'uglifier', '~> 1.0.3'
end

#environment-specific
group :test, :development do
  gem 'debugger'
  gem "factory_girl_rails", "~> 4.0"
  gem 'rspec-rails'
end

group :test do
  gem 'shoulda'
end