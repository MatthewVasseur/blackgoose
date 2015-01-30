class AppointmentMailer < ApplicationMailer
  default from: "appointment@marmar.is"

  def send_tonight_email(apt)
    @time = apt.time
    @location = apt.location
    @client = apt.client
    @escort = apt.escort

    mail(to: @escort.email, subject: 'Appointment Tonight!')
  end

end
