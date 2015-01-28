class AppointmentMailer < ApplicationMailer
  default from: 'matt@marmar.is'

  def tonight_email(apt)
    @time = apt.time
    @location = apt.location
    @client = apt.client
    @escort = apt.escort

    mail(to: apt.escort.email, subject: 'Appointment Tonight!')
  end

end
