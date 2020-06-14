class DoctorsController < ApplicationController
  skip_before_action :authorized

  def index
    @doctors = Doctor.all
    json_response(@doctors)
  end
end
