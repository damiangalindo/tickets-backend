require 'rails_helper'

RSpec.describe API::V1::Tickets do
  include Rack::Test::Methods

  def app
    API::V1::Tickets
  end

  let!(:agent) { create(:user, :agent, authentication_token: 'abc123') }
  let!(:user) { create(:user, authentication_token: 'abcd1234') }
  let(:json) { last_response.body }

  context 'GET /api/v1/tickets/all' do
    let!(:agent_tickets) { create_list(:ticket, 5, user: user, closed_by_id: agent.id, state: 'closed') }

    let!(:tickets) { create_list(:ticket, 5, user: user, state: 'open') }

    let(:parsed_json) { parse_json(json) }

    describe 'on Success' do
      before do
        header 'Authorization', agent.authentication_token
        get '/v1/tickets/all'
        json
      end

      it 'returns a 200 code' do
        expect(last_response.status).to eq(200)
      end

      it 'include the closed tickets' do
        expect(json).to have_json_path('tickets/0/id')
      end
    end

    describe 'on Fail' do
      context 'when authentication_token is missing' do
        before do
          get '/v1/tickets/all'
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
    end
  end

  context 'GET /api/v1/tickets/closed' do
    let!(:agent_tickets) { create_list(:ticket, 5, user: user, closed_by_id: agent.id, state: 'closed') }

    let!(:tickets) { create_list(:ticket, 5, user: user, state: 'open') }

    let(:parsed_json) { parse_json(json) }

    describe 'on Success' do
      before do
        header 'Authorization', agent.authentication_token
        get '/v1/tickets/closed'
        json
      end

      it 'returns a 200 code' do
        expect(last_response.status).to eq(200)
      end

      it 'include the closed tickets' do
        expect(json).to have_json_path('tickets/0/id')
      end
    end

    describe 'on Fail' do
      context 'when authentication_token is missing' do
        before do
          get '/v1/tickets/closed'
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
    end
  end

  context 'POST /api/v1/tickets/create' do
    let(:params) do
      {
        subject: 'test',
        message: 'test message'
      }
    end

    let(:wrong_params) do
      {
        subject: 'test',
        message: ''
      }
    end

    let(:json) { last_response.body }
    let(:parsed_json) { parse_json(json) }

    describe 'on Success' do
      before do
        header 'Authorization', user.authentication_token
      end

      it 'returns a 201 code' do
        post '/v1/tickets/create', params
        expect(last_response.status).to eq(201)
      end

      it 'creates a ticket' do
        expect{ post '/v1/tickets/create', params }.to change { Ticket.count }.by(1)
      end
    end

    describe 'on Fail' do
      context 'when authentication_token is missing' do
        before do
          post '/v1/tickets/create', params
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

      context 'when required param is missing' do
        before do
          header 'Authorization', user.authentication_token
          post '/v1/tickets/create', wrong_params
          json
        end

        it 'returns a 422 code' do
          response = JSON.parse(json)
          expect(response['code']).to eq(422)
        end

        it 'returs an error in the message' do
          response = JSON.parse(json)
          expect(response['message']).to eq("Message can't be blank")
        end
      end
    end
  end

  context 'POST /api/v1/tickets/:ticket_id/close' do
    let(:ticket) { create(:ticket, user: user) }

    describe 'on Success' do
      before do
        header 'Authorization', agent.authentication_token
        put "/v1/tickets/#{ticket.id}/close"
      end

      it 'returns a 200 code' do
        expect(last_response.status).to eq(200)
      end

      it 'closes the ticket' do
        ticket.reload
        expect(ticket.closed?).to eq(true)
      end

      it 'returns the closed ticket' do
        response = JSON.parse(json)
        expect(response['id']).to eq(ticket.id)
      end
    end

    describe 'on Fail' do
      context 'when authentication_token is missing' do
        before do
          put "/v1/tickets/#{ticket.id}/close"
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

      context 'when ticket_id param is missing' do
        before do
          header 'Authorization', agent.authentication_token
          put '/v1/tickets/close'
          json
        end

        it 'returns a 404 code' do
          expect(last_response.status).to eq(404)
        end

        it 'returs an error message' do
          expect(last_response.body).to eq('404 Not Found')
        end
      end
    end
  end
end
