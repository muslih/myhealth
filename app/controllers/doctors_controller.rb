class DoctorsController < ApplicationController
  skip_before_action :authorized, only: [:appointments]
  before_action :set_doctor, only: [:appointments]

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
      json_response({
        error: "Failed to add doctor",
        messages: @doctor.errors
      }, :unprocessable_entity)
    end
  end

  def appointments
    json_response({
      data: @doctor.as_json(include: 'appointments')
    })
  end


  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.permit(:name, :start_time, :end_time, :hospital_id)
  end
end
