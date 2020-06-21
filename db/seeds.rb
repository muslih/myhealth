require 'faker'

STDOUT.puts 'Seeding database...'

(1..10).each do
  user = User.create!(
    name: Faker::Name.unique.name,
    email: Faker::Internet.unique.email,
    username: Faker::Internet.unique.username,
    password: '12345',
    password_confirmation: '12345'
  )

  pp({ id: user.id, email: user.email, password: 'password' })
end

hospital_one = Hospital.create!(
  name: "#{Faker::Address.city} Hospital",
  address:"#{Faker::Address.street_address} #{Faker::Address.secondary_address}"
)
pp({id: hospital_one.id, name: hospital_one.name, address: hospital_one.address})

hospital_two = Hospital.create!(
  name: "#{Faker::Address.city} Hospital",
  address:"#{Faker::Address.street_address} #{Faker::Address.secondary_address}"
)
pp({id: hospital_two.id, name: hospital_two.name, address: hospital_two.address})

Hospital.all.each do |hospital|
  doctor = Doctor.create!(
    name: Faker::Name.unique.name,
    start_time: "08:00",
    end_time: "12:00",
    hospital_id: hospital.id
  ) 

  pp({id: doctor.id, name: doctor.name, start_time: doctor.start_time, end_time: doctor.end_time})

  doctor = Doctor.create!(
    name: Faker::Name.unique.name,
    start_time: "13:00",
    end_time: "15:00",
    hospital_id: hospital.id
  ) 

  pp({id: doctor.id, name: doctor.name, start_time: doctor.start_time, end_time: doctor.end_time})
end

