# Load the rails application
require File.expand_path('../application', __FILE__)

#Mail.defaults do
#  delivery_method :smtp, options
#end

#    config.action_mailer.delivery_method = :smtp
#    config.action_mailer.raise_delivery_errors = true
#    config.action_mailer.default_url_options = { :host => "localhost:3000" }
#    config.action_mailer.raise_delivery_errors = true
    

# Initialize the rails application
Konta3::Application.initialize!
