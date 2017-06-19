require 'grape-swagger'

module API
  module V1
    class Tickets < Grape::API
      include API::V1::Defaults

      namespace :tickets do
        desc 'Create a ticket for a Customer',
             headers: auth_headers

        params do
          requires :subject, type: String, desc: 'Subject of the Ticket'
          requires :message, type: String, desc: 'Message of the Ticket'
        end

        post :create do
          authenticate_customer!
          ticket = current_customer.tickets.new(
                     subject: params[:subject],
                     message: params[:message]
                   )

          if ticket.save
            response = ticket
            type = API::Entities::Ticket
          else
            response = { code: 422, message: ticket.errors.full_messages.join(', ') }
            type = API::Entities::ApiError
          end

          present response, with: type
        end

        desc 'Get the tickets for an Agent',
             headers: auth_headers

        params do
          optional :agent_id, type: String, desc: 'Agent ID'
        end

        get :closed do
          authenticate_agent!

          id = params[:agent_id].present? ? params[:agent_id] : current_agent.id
          tickets = Ticket.where(closed_by_id: id).order('updated_at DESC')

          present tickets, with: API::Entities::Ticket
        end

        desc 'Return all the tickets',
             headers: auth_headers
        get :all do
          authenticate_user!

          tickets = if current_agent
                      Ticket.all.first(30)
                    elsif current_customer
                      current_customer.tickets
                    end

          present tickets, with: API::Entities::Ticket
        end

        desc 'Close a ticket',
             headers: auth_headers

        route_param :ticket_id do
          put :close do
            authenticate_agent!

            ticket = Ticket.find(params[:ticket_id])
            ticket.closed_by_id = current_agent.id
            ticket.close!

            present ticket, with: API::Entities::Ticket
          end
        end

        desc 'Show a ticket',
             headers: auth_headers

        route_param :ticket_id do
          get :show do
            authenticate_user!

            ticket = Ticket.find(params[:ticket_id])

            present ticket, with: API::Entities::Ticket
          end
        end
      end
    end
  end
end
