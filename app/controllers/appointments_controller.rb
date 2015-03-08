class AppointmentsController < ApplicationController
  before_filter :authenticate_client!, only: [:new, :create]

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

    @appointment.time = DateTime.now + params[:hours].to_i.hours

    @appointment.location = params[:street] + ":" + params[:city] + ":" +
      params[:state] + ":" + params[:zip]

    @appointment.client = Client.find(params[:client_ID])
    @appointment.escort = Escort.find(params[:escort_ID])

    respond_to do |format|
      if @appointment.save
        AppointmentMailer.send_tonight_email(@appointment).deliver
        @appointment.escort.update(booked: true)

        $twilio_client.account.messages.create({
          :from => Rails.application.secrets.twilio_my_number,
          :to => "#{@appointment.escort.phone}",
          :body => "Hello #{@appointment.escort.name}! You have a new appointment! #{@appointment}.",
          })

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
