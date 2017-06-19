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

          def authentication_token
            request.headers['Authorization'].presence
          end

          def authenticate_user!
            if !authenticated_user && !current_user
              error!(
                {
                  code: 401,
                  message: 'Unauthorized',
                  with: API::Entities::ApiError
                }, 401
              )
            end
          end

          def authenticate_admin!
            if !authenticated_admin && !current_admin
              error!(
                {
                  code: 401,
                  message: 'Unauthorized',
                  with: API::Entities::ApiError
                }, 401
              )
            end
          end

          def authenticate_customer!
            if !authenticated_customer && !current_customer
              error!(
                {
                  code: 401,
                  message: 'Unauthorized',
                  with: API::Entities::ApiError
                }, 401
              )
            end
          end

          def authenticate_agent!
            if !authenticated_agent && !current_agent
              error!(
                {
                  code: 401,
                  message: 'Unauthorized',
                  with: API::Entities::ApiError
                }, 401
              )
            end
          end

          def current_user
            User.find_by(authentication_token: authentication_token)
          end

          def current_customer
            User.find_by(authentication_token: authentication_token, user_type: 'customer')
          end

          def current_agent
            User.find_by(authentication_token: authentication_token, user_type: 'agent')
          end

          def current_admin
            Admin.find_by(authentication_token: authentication_token)
          end

          %w(admin customer agent user).each do |role|
            define_method "authenticated_#{role}" do
              authentication_token && eval("current_#{role}")
            end
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
