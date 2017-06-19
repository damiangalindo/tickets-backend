require 'grape-swagger'

module API
  module V1
    class Users < Grape::API
      include API::V1::Defaults

      namespace :users do
        desc 'Register a user with the type'
        params do
          requires :username, type: String, desc: 'User username'
          requires :first_name, type: String, desc: 'User first name'
          requires :last_name, type: String, desc: 'User last name'
          requires :email, type: String, desc: 'User email'
          requires :password, type: String, desc: 'User password'
          requires :password_confirmation, type: String, desc: 'User password confirmation'
          optional :user_type, type: String, desc: 'Type of user (customer, agent)'
        end

        post :register do
          user = User.new(
                  username: params[:username],
                  first_name: params[:first_name],
                  last_name: params[:last_name],
                  email: params[:email],
                  password: params[:password],
                  password_confirmation: params[:password_confirmation],
                  user_type: params[:user_type] || 'customer'
                )

          if user.save
            response = { code: 201, message: 'Success' }
            type = API::Entities::ApiSuccess
          else
            response = { code: 422, message: user.errors }
            type = API::Entities::ApiError
          end

          present response, with: type
        end


        desc 'Login a user with email/password and return an authentication_token'
        params do
          requires :email, type: String, desc: 'User email'
          requires :password, type: String, desc: 'User password'
        end

        post :login do
          user = User.authenticate(params[:email], params[:password])

          present user, with: API::Entities::User
        end

        desc 'Logout a user with an authentication_token',
          headers: auth_headers

        delete :logout do
          authenticate_user!
          current_user.update_attributes(authentication_token: nil)

          response = { code: 200, message: 'Success' }
          present response, with: API::Entities::ApiSuccess
        end
      end
    end
  end
end
