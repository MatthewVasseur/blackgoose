# app/controllers/concerns/client_params.rb
class ClientParams < Devise::ParameterSanitizer
  def sign_in
    default_params.permit(:username, :password, :remember_me)
  end

  def sign_up
    default_params.permit(:username, :name, :dob,
    :line1, :city, :state, :zip, :password, :password_confirmation, :terms_of_service)
  end

  def account_update
    default_params.permit(:username, :name, :dob,
    :line1, :city, :state, :zip,  :password, :password_confirmation,
    :current_password)
  end
end
