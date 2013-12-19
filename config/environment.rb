# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Sechandgood::Application.initialize!

Sechandgood::Application.configure do
  config.gem 'sunspot', lib: 'sunspot'
  config.gem 'sunspot_rails', lib: 'sunspot/rails'
end
