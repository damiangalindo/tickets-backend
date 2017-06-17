module API
  module Entities
    class ApiSuccess < Grape::Entity
      expose :code
      expose :message
    end
  end
end
