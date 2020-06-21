## MyHealth - Doctor appointments

### How to run

First clone this repo and then run command below
```
bundle install

bundle exec rails db:migrate
bundle exec rails db:seed

bundle exec rspec
bundle exec rails s
```

### API Documentation

#### Users

#### Doctors
```
curl -X POST \
  http://localhost:3000/doctors \
  -H 'Accept: */*' \
  -H 'Content-Type: application/json' \
  -d '{
  "name": "Doctor jelek",
  "start_time": "08:00",
  "end_time": "19:00",
  "hospital": 1
}'
```

#### Appointments
```
curl -X POST \
  http://localhost:3000/appointments \
  -H 'Accept: */*' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -d '{
  "user_id": 1,
  "doctor_id": 1,
  "book_time": "2020-06-22 08:00:00"
}'
```



