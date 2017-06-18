module API
  module Entities
    class Ticket < Grape::Entity
      root 'tickets'

      expose :id, documentation: { type: 'Integer', desc: 'Ticket ID' }
      expose :subject, documentation: { type: 'String', desc: 'Ticket subject' }
      expose :message, documentation: { type: 'Integer', desc: 'Ticket message' }
      expose :state, documentation: { type: 'String', desc: 'Ticket state' }
    end
  end
end
