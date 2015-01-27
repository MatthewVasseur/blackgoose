class StaticsController < ApplicationController
  def home
    if client_signed_in?
      redirect_to home_client_path
    end
  end
end
