require 'grape-swagger'

module API
  module V1
    class Tickets < Grape::API
      include API::V1::Defaults

      namespace :tickets do
        desc 'Create a ticket for a Customer',
             headers: auth_headers

        params do
          requires :user_id, type: String, desc: 'User ID'
          requires :subject, type: String, desc: 'Subject of the Ticket'
          requires :message, type: String, desc: 'Message of the Ticket'
        end

        post :create do
          authenticate!
          r = { code: code, message: 'Success' }
          present r, with: API::Entities::ApiSuccess
        end

        desc 'Get the tickets for a Agent',
             headers: auth_headers

        route_param :agent_id do
          get do
            authenticate!

            response = Ticket.where(closed_by_id: params[:agent_id])

            present response, with: API::Entities::Ticket
          end
        end
      end
    end
  end
end
