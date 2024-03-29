require_relative 'boot'
#require 'report_error_observer'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ItineraryPlanner
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.active_record.observers = :report_error_observer

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
        address: "smtp.gmail.com",
        domain: "gmail.com",
        port: 587,
        user_name: "itineraryplannerhelp@gmail.com",
        password: "itsawesome",
        authentication: 'plain',
        enable_starttls_auto: true
    }
  end
end
