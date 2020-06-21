require 'rails_helper'

RSpec.describe Appointment, type: :model do

  let!(:user) { User.create name: "user name",
                username: "user",
                email: "user@user.com",
                password: "12345",
                password_confirmation: "12345" }

  let!(:hospital) { Hospital.create name: "SambangLihum Hospital",
                    address: "Banjarbaru, Kalimantan Selatan" }

  let!(:doctor) { Doctor.create name: "Utuhlabut",
                  start_time: "08:00",
                  end_time: "12:00",
                  hospital: hospital }

  describe 'schedule validations' do
    context 'when user book 30 minutes before schedule' do
      it 'should return invalid' do
        @appointment = Appointment.new(
          user_id: user.id,
          doctor_id: doctor.id,
          book_time: "2020-06-22 08:00".in_time_zone
        )

        @appointment.save

        expect(@appointment.valid?).to eq(false)
        expect(@appointment.errors.count).to eq(1)
      end
    end

    context 'when user book more than 30 minutes before schedule' do
      it 'should be valid' do
        @appointment = Appointment.new(
          user_id: user.id,
          doctor_id: doctor.id,
          book_time: "2020-06-22 07:00".in_time_zone
        )

        expect(@appointment.valid?).to eq(true)
      end
    end
    
    context 'when user book in weekend' do
      it 'should be invalid' do
        @appointment = Appointment.new(
          user_id: user.id,
          doctor_id: doctor.id,
          book_time: "2020-06-21 07:00".in_time_zone
        )

        expect(@appointment.valid?).to eq(false)
      end
    end

    context 'when user book in weekday' do
      it 'should be valid' do
        @appointment = Appointment.new(
          user_id: user.id,
          doctor_id: doctor.id,
          book_time: "2020-06-23 07:00".in_time_zone
        )

        expect(@appointment.valid?).to eq(true)
      end
    end

    context 'when user book same doctor less than 10' do
      it 'should be valid' do
        @appointment = Appointment.new(
          user_id: user.id,
          doctor_id: doctor.id,
          book_time: "2020-06-23 07:00".in_time_zone
        )

        expect(@appointment.valid?).to eq(true)
      end
    end

    context 'when user book same doctor more than 10' do
      before do
        10.times do
          Appointment.create(
            user_id: user.id,
            doctor_id: doctor.id,
            book_time: "2020-06-23 07:00".in_time_zone
          )
        end
      end

      it 'should be invalid' do
        @appointment = Appointment.new(
          user_id: user.id,
          doctor_id: doctor.id,
          book_time: "2020-06-23 07:00".in_time_zone
        )

        @appointment.save

        expect(@appointment.valid?).to eq(false)
      end
    end
  end
end

