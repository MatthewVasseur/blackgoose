class AppointmentMailer < ApplicationMailer
  default from: "appointment@marmar.is"

  def send_notif_email(apt)
    @time = apt.time
    @location = apt.location
    @client = apt.client
    @escort = apt.escort

    mail(to: @escort.email, subject: 'Appointment Tonight!')
  end

  def send_notif_text(apt)
    $twilio_client.account.messages.create({
      :from => Rails.application.secrets.twilio_my_number,
      :to => "#{apt.escort.phone}",
      :body => "Hello #{apt.escort.name}! You have a new appointment! Please check your email for details.",
      })
  end
end
