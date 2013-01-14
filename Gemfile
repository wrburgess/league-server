source 'https://rubygems.org'

# core
ruby '1.9.3'
gem 'rails', '3.2.11'

# plugins
gem 'devise', '~> 2.2.1'
gem 'haml-rails', '~> 0.3.5'
gem 'json', '~> 1.7.6'
gem 'omniauth', '1.1.1'
gem 'newrelic_rpm', '~> 3.5.4.34'
gem 'pg', '~> 0.14.1'
gem 'rabl', '~> 0.7.9'
gem 'resque', :require => 'resque/server'
gem 'sass-rails', '~> 3.2.3'
gem 'settingslogic', '~> 2.0.9'
gem 'thin', '~> 1.5.0'

#asset-specific
group :assets do
  gem 'uglifier', '~> 1.3.0'
end

#environment-specific
group :test, :development do
  gem 'better_errors', '~> 0.3.2'
  gem 'binding_of_caller', '~> 0.6.8'
  gem 'debugger', '~> 1.2.3'
  gem 'factory_girl_rails', '~> 4.1.0'
  gem 'mail_view', '~> 1.0.3'
  gem 'rspec-rails', '~> 2.12.2'
end

group :test do
  gem 'shoulda', '~> 3.3.2'
end