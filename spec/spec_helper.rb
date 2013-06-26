ENV["RAILS_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)
require "rspec/rails"
require "rspec/autorun"
require "database_cleaner"
require "capybara/rails"

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

DatabaseCleaner.strategy = :truncation

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"

  config.before do
    DatabaseCleaner.start
    ActionMailer::Base.deliveries.clear
  end

  config.after do
    DatabaseCleaner.clean
  end
end
