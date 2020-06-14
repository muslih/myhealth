# frozen_string_literal: true

class Doctor < ApplicationRecord
  has_many :appointments
  validates_presence_of :name, :start_time, :end_time
end
