class AccountMailer < ApplicationMailer
  default to: "registrations@marmar.is"

  def send_verify_account(account)
    @account = account


    mail(subject: "Verify This Account!")
  end

end
