# app/models/concerns/verify_email.rb
module VerifyEmail
  extend ActiveSupport::Concern

  included do
    after_create :send_verify_email
  end

  protected

  def send_verify_email
    AccountMailer.send_verify_account(self).deliver
  end
end
