# rubocop:disable Metrics/ModuleLength
module API
  module V1
    module Defaults
      extend ActiveSupport::Concern

      included do
        version 'v1', using: :path
        format :json

        helpers do
          def authenticate!
            unless authenticated
              error!(
                {
                  code: 401,
                  message: 'Unauthorized',
                  with: API::Entities::ApiError
                }, 401
              )
            end
          end

          def permitted_params
            @permitted_params ||= declared(params, include_missing: false)
          end

          def logger
            Rails.logger
          end

          def authenticated
            true
          end
        end

        def self.auth_headers
          {
            Authorization: {
              description: 'Validates Authorization Token',
              required: true
            }
          }
        end

        rescue_from ActiveRecord::RecordNotFound do
          error!({
                   code: 404,
                   message: 'Couldn\'t find a record that meet the criteria.',
                   with: API::Entities::ApiError
                 }, 404)
        end

        rescue_from ActiveRecord::RecordInvalid do |e|
          error!({
                   code: 422,
                   message: e.message,
                   with: API::Entities::ApiError
                 }, 422)
        end
      end
    end
  end
end
# rubocop:enable Metrics/ModuleLength
