require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'Users API', type: :request do
    let!(:user) { User.create username: "test",name: "testing", email: "test@test.com", password: "12345", password_confirmation: "12345" }

    describe 'POST /login' do
      context 'when params is valid' do 
        valid_params = {
          email: "test@test.com",
          password: "12345"
        }

        it 'should not returns error message' do
          post "/login", params: valid_params

          expect(response.status).to eq(200)
          expect(JSON.parse(response.body)['data']).to eq(user.as_json)
          expect(JSON.parse(response.body)['token']).to_not eq(nil)
          expect(JSON.parse(response.body)['error']).to eq(nil)
        end
      end

      context 'when params is invalid' do 
        invalid_params = {
          email: "test@test.com",
          password: "wrong password"
        }

        it 'returns error message' do
          post "/login", params: invalid_params

          expect(response.status).to eq(401)
          expect(JSON.parse(response.body)['user']).to eq(nil)
          expect(JSON.parse(response.body)['token']).to eq(nil)
          expect(JSON.parse(response.body)['error']).to_not eq(nil)
        end
      end

    end
  end
end
