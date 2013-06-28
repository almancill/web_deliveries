# Load the rails application
require File.expand_path('../application', __FILE__)

ActionMailer::Base.smtp_settings = {
  :user_name => 'app16575779@heroku.com',
  :password => 'uowg5lo7',
  :domain => 'domiflash.herokuapp.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}

# Initialize the rails application
WebDeliveries::Application.initialize!
