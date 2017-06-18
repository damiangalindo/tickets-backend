module API
  module Entities
    class Response < Grape::Entity
      root 'responses'

      expose :id, documentation: { type: 'Integer', desc: 'Response ID' }
      expose :response, documentation: { type: 'String', desc: 'Reponse Text' }
    end
  end
end
