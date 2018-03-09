# Load the Rails application.
require File.expand_path('../application', __FILE__)
require 'tlsmail'

# Initialize the Rails application.
Rails.application.initialize!

Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.smtp_settings = {
	:enable_starttls_auto => true,  
	:address => "smtp.gmail.com",
  	:port    => 587,
  	:tls => true,
  	:domain => 'gmail.com',
  	:authentication => :plain,
  	:user_name => ENV["GMAIL_USERNAME"],
  	:password => ENV["GMAIL_PASSWORD"]
}