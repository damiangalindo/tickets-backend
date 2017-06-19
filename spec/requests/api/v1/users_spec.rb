require 'rails_helper'

RSpec.describe API::V1::Users do
  include Rack::Test::Methods

  def app
    API::V1::Users
  end

  context 'POST /api/v1/users/register' do
    let(:params) do
      {
        first_name: 'test',
        last_name: 'test',
        email: 'test@test.com',
        username: 'test_test',
        password: 'password',
        password_confirmation: 'password'
      }
    end

    let(:wrong_params) do
      {
        first_name: 'test',
        last_name: 'test',
        email: '',
        username: 'test_test',
        password: 'password',
        password_confirmation: 'password_confirmation'
      }
    end

    let(:response) { JSON.parse(last_response.body) }

    describe 'on Success' do
      before do
        post '/v1/users/register', params
        response
      end

      it 'returns a 201 code' do
        expect(response['code']).to eq(201)
      end

      it 'returns a Success message' do
        expect(response['message']).to eq('Success')
      end
    end

    describe 'on Fail' do
      before do
        post '/v1/users/register', wrong_params
        response
      end

      it 'returns a 422 code' do
        expect(response['code']).to eq(422)
      end

      it 'returs an error in the message' do
        expect(response['message']).not_to eq('Success')
      end
    end
  end

  context 'POST /api/v1/users/login' do
    let(:params) do
      {
        email: 'test@test.com',
        username: 'test_test',
        password: 'password'
      }
    end

    let(:wrong_params) do
      {
        email: '',
        username: 'test_test',
        password: 'password'
      }
    end

    let(:response) { JSON.parse(last_response.body) }

    let!(:user) { create(:user, email: 'test@test.com', password: 'password', password_confirmation: 'password') }

    describe 'on Success' do
      before do
        post 'v1/users/login', params
        response
      end

      it 'returns a 201 code' do
        expect(last_response.status).to eq(201)
      end

      it 'returns the authentication_token of the user' do
        expect(response['authentication_token']).to eq(user.authentication_token)
      end
    end

    describe 'on Fail' do
      pending 'Add test for login'
    end
  end

  context 'DELETE /api/v1/users/logout' do
    let!(:user) { create(:user, authentication_token: 'abc123') }
    let(:response) { JSON.parse(last_response.body) }

    describe 'on Success' do
      before do
        header 'Authorization', user.authentication_token
        delete '/v1/users/logout'
        response
      end

      it 'changes the authentication_token' do
        user.reload
        expect(user.authentication_token).not_to eq('abc123')
      end

      it 'returns a 200 code' do
        expect(response['code']).to eq(200)
      end
    end

    describe 'on Fail' do
      context 'when authentication_token is missing' do
        before do
          delete '/v1/users/logout'
          response
        end

        it 'returns a 401 code' do
          expect(last_response.status).to eq(401)
        end

        it 'returs an error in the message' do
          expect(response['message']).to eq('Unauthorized')
        end
      end
    end
  end
end
