class AccountMailer < ApplicationMailer
  default to: "registrations@marmar.is"

  def send_verify_account(account)
    @name = account.name
    @dob = account.dob
    @address = account.address

    mail(subject: "Verify This Account!")
  end

end
