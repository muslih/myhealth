class HospitalsController < ApplicationController
  # include ::ActionController::Serialization
  skip_before_action :authorized

  def index
    @hospitals = Hospital.all
    
    json_response({
      data: @hospitals.as_json(include: 'doctors')
    })
  end
end
