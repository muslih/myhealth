class Appointment < ApplicationRecord
  LIMIT_USER = 10 

  belongs_to :user
  belongs_to :doctor

  validates_presence_of :book_time
  validate :schedule_validations

  def schedule_validations
    # can book within 30 minutes before doctor starts
    errors.add(:book_time, 'You only can book within 30 minutes before the doctor starts the schedule') if booking_time > doctor.max_booking
    # can book within weekday
    errors.add(:book_time, 'You only can book within weekday') if book_time.on_weekend?
    # only 10 user can book same doctor
    errors.add(:doctor_id, "only #{LIMIT_USER} users can book the same doctor.") if limit_patient_reached?
  end

  private

  def limit_patient_reached?
    Appointment.where(doctor_id: doctor_id, book_time: book_time.all_day).count >= LIMIT_USER
  end

  def booking_time
    book_time.strftime('%H:%M')
  end
end
