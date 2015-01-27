class AppointmentsController < ApplicationController
  before_filter :authenticate_client!, only: [:new]

  def new
    @appointment = Appointment.new
    @escort = Escort.find(params[:escort_ID])
    @client = current_client
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.location = params[:street] + ":" + params[:city] + ":" +
      params[:state] + ":" + params[:zip]

    @appointment.client = Client.find(params[:client_ID])
    @appointment.escort = Escort.find(params[:escort_ID])

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to profile_client_path, notice: "Thank you for scheduling an Appointment!" }
      else
        format.html { render :new} # new_appointment, notice: "We're sorry, there was an error with your purchase" }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def appointment_params
    params.require(:appointment).permit(:time, :price)
  end
end
