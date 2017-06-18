require 'grape-swagger'

module API
  module V1
    class Responses < Grape::API
      include API::V1::Defaults

      namespace :responses do
        route_param :ticket_id do

          desc 'Create a response for a ticket',
               headers: auth_headers

          params do
            requires :response, type: String, desc: 'Reponse for a given ticket'
          end

          post :create do
            authenticate_user!

            ticket = Ticket.find(params[:ticket_id])

            response = ticket.responses.new(
                       response: params[:response],
                       user_id: current_user.id
                     )

            if response.save
              type = API::Entities::Response
            else
              response = { code: 422, message: response.errors.full_messages.join(', ') }
              type = API::Entities::ApiError
            end

            present response, with: type
          end

          desc 'Get the responses for a ticket',
               headers: auth_headers

          get do
            authenticate_user!

            ticket = Ticket.find(params[:ticket_id])
            responses = ticket.responses

            present responses, with: API::Entities::Response
          end
        end
      end
    end
  end
end
