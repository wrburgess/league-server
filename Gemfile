source 'https://rubygems.org'

# core
ruby '1.9.3'
gem 'rails', '3.2.8'

# plugins
gem 'devise', '~> 2.1.2'
gem 'haml-rails'
gem 'json'
gem 'omniauth'
gem 'pg'
gem 'rabl'
gem 'resque', :require => 'resque/server'
gem 'sass-rails', '~> 3.2.3'
gem 'settingslogic'
gem 'thin'

#asset-specific
group :assets do
  gem 'uglifier', '~> 1.0.3'
end

#environment-specific
group :test, :development do
  gem 'debugger'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'mail_view', git: 'git://github.com/37signals/mail_view.git', ref: '6a4bc7f01a'
  gem 'rspec-rails'
end

group :test do
  gem 'shoulda'
end