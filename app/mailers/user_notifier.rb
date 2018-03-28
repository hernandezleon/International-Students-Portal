class UserNotifier < ApplicationMailer
  default :from => 'communications@internationalsp.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_confirm_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Your School Administrator account has been approved. 
    Login now at http://www.internationalsp.com/users/sign_in . Here you can start adding information about your school and interact with prospective students.' )
    # using SendGrid's Ruby Library
	# https://github.com/sendgrid/sendgrid-ruby
	# require 'sendgrid-ruby'
	# include SendGrid

	# from = Email.new(email: 'test@example.com')
	# to = Email.new(email: 'test@example.com')
	# subject = 'Sending with SendGrid is Fun'
	# content = Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
	# mail = Mail.new(from, subject, to, content)

	# sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
	# response = sg.client.mail._('send').post(request_body: mail.to_json)
	# puts response.status_code
	# puts response.body
	# puts response.headers
  end

  def confirmation_pending(user)
  	 @user = user
     mail( :to => @user.email,
    :subject => 'You have signed up for a School Administrator account which won\'t be accessible
    until your account is approved. You will receive an email once your account has been approved. Thank you
    for choosing International Students Portal' )
  end	

end
