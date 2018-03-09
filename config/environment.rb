# Load the Rails application.
require File.expand_path('../application', __FILE__)
require 'tlsmail'
require 'openssl'

# Initialize the Rails application.
Rails.application.initialize!

require 'net/smtp'
Net.instance_eval {remove_const :SMTPSession} if defined?(Net::SMTPSession)

require 'net/pop'
Net::POP.instance_eval {remove_const :Revision} if defined?(Net::POP::Revision)
Net.instance_eval {remove_const :POP} if defined?(Net::POP)
Net.instance_eval {remove_const :POPSession} if defined?(Net::POPSession)
Net.instance_eval {remove_const :POP3Session} if defined?(Net::POP3Session)
Net.instance_eval {remove_const :APOPSession} if defined?(Net::APOPSession)

# ActionMailer::Base.action_mailer.default_url_options = { :host => 'international-students-portal.herokuapp.com' }

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