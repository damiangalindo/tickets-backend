require 'rails_helper'

RSpec.describe API::V1::Responses do
  include Rack::Test::Methods

  def app
    API::V1::Responses
  end

  let!(:agent) { create(:user, :agent, authentication_token: 'abc123') }
  let!(:user) { create(:user, authentication_token: 'abcd1234') }
  let(:ticket) { create(:ticket, user: user) }

  context 'GET /api/v1/responses' do
    let!(:agent_responses) { create_list(:response, 5, user: agent, response: 'response', ticket: ticket) }

    let!(:user_responses) { create_list(:response, 5, user: user, response: 'user_response', ticket: ticket) }

    let(:json) { last_response.body }

    let(:parsed_json) { parse_json(json) }

    describe 'on Success' do
      before do
        header 'Authorization', agent.authentication_token
        get "/v1/responses/#{ticket.id}"
        json
      end

      it 'returns a 200 code' do
        expect(last_response.status).to eq(200)
      end

      it 'include the ticket responses' do
        expect(json).to have_json_path('responses/0/id')
      end
    end

    describe 'on Fail' do
      context 'when authentication_token is missing' do
        before do
          get "/v1/responses/#{ticket.id}"
          json
        end

        it 'returns a 401 code' do
          expect(last_response.status).to eq(401)
        end

        it 'returs an error in the message' do
          response = JSON.parse(json)
          expect(response['message']).to eq('Unauthorized')
        end
      end

      context 'when ticket_id is missing' do
        before do
          header 'Authorization', agent.authentication_token
          get '/v1/responses/'
          json
        end

        it 'returns a 404 code' do
          expect(last_response.status).to eq(404)
        end

        it 'returs an error in the message' do
          expect(last_response.body).to eq('404 Not Found')
        end
      end
    end
  end

  context 'POST /api/v1/responses/:ticket_id/create' do
    let(:params) do
      {
        response: 'test'
      }
    end

    let(:wrong_params) do
      {
        response: ''
      }
    end

    let(:json) { last_response.body }
    let(:parsed_json) { parse_json(json) }

    describe 'on Success' do
      before do
        header 'Authorization', user.authentication_token
      end

      it 'returns a 201 code' do
        post "/v1/responses/#{ticket.id}/create", params
        expect(last_response.status).to eq(201)
      end

      it 'creates a ticket' do
        expect{ post "/v1/responses/#{ticket.id}/create", params }.to change { Ticket.count }.by(1)
      end
    end

    describe 'on Fail' do
      context 'when authentication_token is missing' do
        before do
          post "/v1/responses/#{ticket.id}/create", params
          json
        end

        it 'returns a 401 code' do
          expect(last_response.status).to eq(401)
        end

        it 'returs an error in the message' do
          response = JSON.parse(json)
          expect(response['message']).to eq('Unauthorized')
        end
      end

      context 'when ticket_id is missing' do
        before do
          header 'Authorization', agent.authentication_token
          get '/v1/responses/create'
          json
        end

        it 'returns a 404 code' do
          response = JSON.parse(json)
          expect(response['code']).to eq(404)
        end

        it 'returs an error in the message' do
          response = JSON.parse(json)
          expect(response['message']).to eq("Couldn't find a record that meet the criteria.")
        end
      end

      context 'when required param is missing' do
        before do
          header 'Authorization', user.authentication_token
          post "/v1/responses/#{ticket.id}/create", wrong_params
          json
        end

        it 'returns a 422 code' do
          response = JSON.parse(json)
          expect(response['code']).to eq(422)
        end

        it 'returs an error in the message' do
          response = JSON.parse(json)
          expect(response['message']).to eq("Response can't be blank")
        end
      end
    end
  end
end
