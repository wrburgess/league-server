# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
League::Application.initialize!

# Designate ActionMailer to recognize HAML files
# ActionMailer::Base.register_template_extension('haml')
