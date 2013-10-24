# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
OmmYo::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.mandrillapp.com',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['MANDRILL_USERNAME'],
  :password       => ENV['MANDRILL_PASSWORD'],
  :domain         => 'mailer.ommyo.com',
  :enable_starttls_auto => true
}
