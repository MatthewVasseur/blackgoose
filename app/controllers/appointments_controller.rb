class AppointmentsController < ApplicationController
  before_filter :authenticate_client!, only: [:new]

  def new
    @appointment = Appointment.new
    @escort = Escort.find(params[:escort_ID])
    @client = current_client

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @appointment = Appointment.new(appointment_params)

    @appointment.time = DateTime.now + hours.to_i.hours

    @appointment.location = params[:street] + ":" + params[:city] + ":" +
      params[:state] + ":" + params[:zip]

    @appointment.client = Client.find(params[:client_ID])
    @appointment.escort = Escort.find(params[:escort_ID])

    respond_to do |format|
      if @appointment.save
        AppointmentMailer.tonight_email(@appointment).deliver
        @appointment.escort.update(booked: true)
        format.html { redirect_to home_client_path, notice: "Thank you for scheduling an Appointment!" }
      else
        format.html { render :new} # new_appointment, notice: "We're sorry, there was an error with your booking" }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def appointment_params
    params.require(:appointment).permit(:price)
  end
end
