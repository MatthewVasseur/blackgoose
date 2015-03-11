class EscortsController < ApplicationController
  before_filter :authenticate_escort!, only: [:profile]

  def index
    if params[:time_now] == "true"
      @escorts = Escort.where(online: true)
    else
      @escorts = Escort.all
    end

    if !params[:search].blank?
      @escorts = Escort.where("username LIKE ? OR hairc LIKE ? OR eyec LIKE ? OR ethnicity LIKE ?", "%#{params[:search].downcase}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @escort = Escort.find_by_username(params[:username])
    # only allow appointments to be made by clients
    if client_signed_in?
      @client = current_client
      @appointment = Appointment.new
    end
  end

  def profile
    @escort = current_escort
    @past_appointments = @escort.appointments
  end
end
