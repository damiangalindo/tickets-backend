Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount API::Base, at: '/api'
  mount GrapeSwaggerRails::Engine, at: '/apidoc'

  root to: 'home#index'
end

# == Route Map
#
#                         Prefix Verb       URI Pattern                               Controller#Action
#                     okcomputer            /okcomputer                               OkComputer::Engine
#         new_admin_user_session GET        /admin/login(.:format)                    active_admin/devise/sessions#new
#             admin_user_session POST       /admin/login(.:format)                    active_admin/devise/sessions#create
#     destroy_admin_user_session DELETE|GET /admin/logout(.:format)                   active_admin/devise/sessions#destroy
#        new_admin_user_password GET        /admin/password/new(.:format)             active_admin/devise/passwords#new
#       edit_admin_user_password GET        /admin/password/edit(.:format)            active_admin/devise/passwords#edit
#            admin_user_password PATCH      /admin/password(.:format)                 active_admin/devise/passwords#update
#                                PUT        /admin/password(.:format)                 active_admin/devise/passwords#update
#                                POST       /admin/password(.:format)                 active_admin/devise/passwords#create
#                     admin_root GET        /admin(.:format)                          admin/dashboard#index
# batch_action_admin_admin_users POST       /admin/admin_users/batch_action(.:format) admin/admin_users#batch_action
#              admin_admin_users GET        /admin/admin_users(.:format)              admin/admin_users#index
#                                POST       /admin/admin_users(.:format)              admin/admin_users#create
#           new_admin_admin_user GET        /admin/admin_users/new(.:format)          admin/admin_users#new
#          edit_admin_admin_user GET        /admin/admin_users/:id/edit(.:format)     admin/admin_users#edit
#               admin_admin_user GET        /admin/admin_users/:id(.:format)          admin/admin_users#show
#                                PATCH      /admin/admin_users/:id(.:format)          admin/admin_users#update
#                                PUT        /admin/admin_users/:id(.:format)          admin/admin_users#update
#                                DELETE     /admin/admin_users/:id(.:format)          admin/admin_users#destroy
#                admin_dashboard GET        /admin/dashboard(.:format)                admin/dashboard#index
#                 admin_comments GET        /admin/comments(.:format)                 admin/comments#index
#                                POST       /admin/comments(.:format)                 admin/comments#create
#                  admin_comment GET        /admin/comments/:id(.:format)             admin/comments#show
#                                DELETE     /admin/comments/:id(.:format)             admin/comments#destroy
#               new_user_session GET        /users/sign_in(.:format)                  devise/sessions#new
#                   user_session POST       /users/sign_in(.:format)                  devise/sessions#create
#           destroy_user_session DELETE     /users/sign_out(.:format)                 devise/sessions#destroy
#              new_user_password GET        /users/password/new(.:format)             devise/passwords#new
#             edit_user_password GET        /users/password/edit(.:format)            devise/passwords#edit
#                  user_password PATCH      /users/password(.:format)                 devise/passwords#update
#                                PUT        /users/password(.:format)                 devise/passwords#update
#                                POST       /users/password(.:format)                 devise/passwords#create
#       cancel_user_registration GET        /users/cancel(.:format)                   devise/registrations#cancel
#          new_user_registration GET        /users/sign_up(.:format)                  devise/registrations#new
#         edit_user_registration GET        /users/edit(.:format)                     devise/registrations#edit
#              user_registration PATCH      /users(.:format)                          devise/registrations#update
#                                PUT        /users(.:format)                          devise/registrations#update
#                                DELETE     /users(.:format)                          devise/registrations#destroy
#                                POST       /users(.:format)                          devise/registrations#create
#                       api_base            /api                                      API::Base
#            grape_swagger_rails            /apidoc                                   GrapeSwaggerRails::Engine
#                           root GET        /                                         home#index
#
# Routes for OkComputer::Engine:
#              root GET|OPTIONS /                 ok_computer/ok_computer#show {:check=>"default"}
# okcomputer_checks GET|OPTIONS /all(.:format)    ok_computer/ok_computer#index
#  okcomputer_check GET|OPTIONS /:check(.:format) ok_computer/ok_computer#show
#
# Routes for GrapeSwaggerRails::Engine:
#   root GET  /           grape_swagger_rails/application#index
#
