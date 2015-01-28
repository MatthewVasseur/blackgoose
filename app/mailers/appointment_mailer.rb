require 'mail'

Mail.defaults do
  delivery_method :smtp, {
    :address => 'smtp.sendgrid.net',
    :port => '587',
    :domain => 'heroku.com',
    :user_name => ENV['SENDGRID_USERNAME'],
    :password => ENV['SENDGRID_PASSWORD'],
    :authentication => :plain,
    :enable_starttls_auto => true
  }
end

class AppointmentMailer < ApplicationMailer
  default from: "matt@marmar.is"

  def tonight_email(apt)
    @time = apt.time
    @location = apt.location
    @client = apt.client
    @escort = apt.escort

    mail(to: "mattvasseur@gmail.com", subject: 'Appointment Tonight!')
  end

end
