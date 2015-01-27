# app/controllers/concerns/escort_params.rb
class EscortParams < Devise::ParameterSanitizer
  def sign_in
    default_params.permit(:loginKey, :email, :username, :password, :remember_me)
  end

  def sign_up
    default_params.permit(:email, :username, :name, :dob,
    :line1, :city, :state, :zip, :height, :weight, :ethnicity, :tit_size,
    :tit_type, :eyec, :hairc, :password, :password_confirmation, :terms_of_service)
  end

  def account_update
    default_params.permit(:email, :username, :name, :dob,
    :line1, :city, :state, :zip, :height, :weight, :ethnicity, :tit_size,
    :tit_type, :eyec, :hairc, :password, :password_confirmation,
    :current_password)
  end
end
