class HospitalsController < ApplicationController
  skip_before_action :authorized

  def index
    @hospitals = Hospital.all
    json_response(@hospitals)
  end
end
