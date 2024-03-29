class ClientsController < ApplicationController
  before_filter :authenticate_client!, only: [:profile]

  def profile
    @client = current_client
    @past_appointments = @client.appointments
  end

  def home
    if !client_signed_in?
      redirect_to root_path
    end

    gon.page = @page

  end
end
