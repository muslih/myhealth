require 'rails_helper'

RSpec.describe DoctorsController, type: :controller do
  describe 'Doctors API', type: :request do
    let!(:hospital) {
      Hospital.create name: "First Hospital", address: "Planet namec"
    }

    let!(:doctor) { Doctor.create name: "Osky", start_time: "08:00", end_time: "12:00", hospital: hospital }

    describe 'GET /index' do
      it 'should return list doctors' do
        get "/doctors"

        expect(response.status).to eq(200)
        expect(JSON.parse(response.body)['data']).to eq(Doctor.all.as_json)
        expect(JSON.parse(response.body)['error']).to eq(nil)
      end
    end

    describe 'GET doctors/:id/appointments' do
      let!(:user) { User.create(
        name: "user name",
        username: "user",
        email: "user@user.com",
        password: "12345",
        password_confirmation: "12345") 
      }

      let!(:appointment) { Appointment.create(
          user_id: user.id,
          doctor_id: doctor.id,
          book_time: "2020-06-23 07:00".in_time_zone)
      }

      it 'should return doctor\'s appointments' do
        get "/doctors/#{doctor.id}/appointments"

        expect(response.status).to eq(200)
        expect(JSON.parse(response.body)['data']).to eq(doctor.as_json(include: 'appointments'))
        expect(JSON.parse(response.body)['data']['appointments']).to eq(doctor.appointments.as_json)
        expect(JSON.parse(response.body)['error']).to eq(nil)
      end
    end
  end
end
