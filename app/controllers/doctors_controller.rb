class DoctorsController < ApplicationController
  skip_before_action :authorized

  def index
    @doctors = Doctor.all
    json_response(@doctors)
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      render json: {
        data: @doctor,
        message: 'Doctor created successfully'
      }
    else
      render json: {
        error: "Failed to add doctor",
        messages: @doctor.errors.messages
      }
    end
  end

  private

  def doctor_params
    params.permit(:name, :start_time, :end_time)
  end
end
