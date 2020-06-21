class AppointmentsController < ApplicationController
  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      render json: @appointment
    else
      render json: {error: "Unable to create appointment", message: @appointment.errors.messages}
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:user_id, :doctor_id, :book_time)
  end
end
