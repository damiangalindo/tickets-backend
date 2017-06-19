module API
  module Entities
    class Response < Grape::Entity
      root 'responses'

      expose :id, documentation: { type: 'Integer', desc: 'Response ID' }
      expose :response, documentation: { type: 'String', desc: 'Reponse Text' }
      expose :username, documentation: { type: 'String', desc: 'User\'s username' }
      expose :user_type, documentation: { type: 'String', desc: 'User\'s role' }
    end
  end
end
