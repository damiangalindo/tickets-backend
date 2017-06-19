module API
  module Entities
    class User < Grape::Entity
      root 'user'

      expose :authentication_token, documentation: { type: 'String', desc: 'authentication_token' }
      expose :user_type, documentation: { type: 'String', desc: 'User Role' }
    end
  end
end
