require 'grape-swagger'

module API
  module V1
    class Admins < Grape::API
      include API::V1::Defaults

      namespace :admins do
        desc 'Register an admin'
        params do
          requires :email, type: String, desc: 'User email'
          requires :password, type: String, desc: 'User password'
          requires :password_confirmation, type: String, desc: 'User password confirmation'
        end

        post :register do
          admin = Admin.new(
                  email: params[:email],
                  password: params[:password],
                  password_confirmation: params[:password_confirmation]
                )

          if admin.save
            response = { code: 201, message: 'Success' }
            type = API::Entities::ApiSuccess
          else
            response = { code: 422, message: admin.errors.full_messages.join(', ') }
            type = API::Entities::ApiError
          end

          present response, with: type
        end


        desc 'Login a admin with email/password and return a authentication_token'
        params do
          requires :email, type: String, desc: 'Admin email'
          requires :password, type: String, desc: 'Admin password'
        end

        post :login do
          puts warden.authenticate(params[:email], params[:password])
        end
      end
    end
  end
end
