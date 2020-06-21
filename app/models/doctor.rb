# frozen_string_literal: true

class Doctor < ApplicationRecord
  has_many :appointments
  belongs_to :hospital

  validates_presence_of :name, :start_time, :end_time

  def max_booking
    (start_time - 30.minutes).strftime('%H:%M')
  end
end
