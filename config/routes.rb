Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount API::Base, at: '/api'
  mount GrapeSwaggerRails::Engine, at: '/apidoc'

  root to: 'home#index'
end

# == Route Map
#
#                    Prefix Verb   URI Pattern                     Controller#Action
#                okcomputer        /okcomputer                     OkComputer::Engine
#         new_admin_session GET    /admins/sign_in(.:format)       devise/sessions#new
#             admin_session POST   /admins/sign_in(.:format)       devise/sessions#create
#     destroy_admin_session DELETE /admins/sign_out(.:format)      devise/sessions#destroy
#        new_admin_password GET    /admins/password/new(.:format)  devise/passwords#new
#       edit_admin_password GET    /admins/password/edit(.:format) devise/passwords#edit
#            admin_password PATCH  /admins/password(.:format)      devise/passwords#update
#                           PUT    /admins/password(.:format)      devise/passwords#update
#                           POST   /admins/password(.:format)      devise/passwords#create
# cancel_admin_registration GET    /admins/cancel(.:format)        devise/registrations#cancel
#    new_admin_registration GET    /admins/sign_up(.:format)       devise/registrations#new
#   edit_admin_registration GET    /admins/edit(.:format)          devise/registrations#edit
#        admin_registration PATCH  /admins(.:format)               devise/registrations#update
#                           PUT    /admins(.:format)               devise/registrations#update
#                           DELETE /admins(.:format)               devise/registrations#destroy
#                           POST   /admins(.:format)               devise/registrations#create
#          new_user_session GET    /users/sign_in(.:format)        devise/sessions#new
#              user_session POST   /users/sign_in(.:format)        devise/sessions#create
#      destroy_user_session DELETE /users/sign_out(.:format)       devise/sessions#destroy
#         new_user_password GET    /users/password/new(.:format)   devise/passwords#new
#        edit_user_password GET    /users/password/edit(.:format)  devise/passwords#edit
#             user_password PATCH  /users/password(.:format)       devise/passwords#update
#                           PUT    /users/password(.:format)       devise/passwords#update
#                           POST   /users/password(.:format)       devise/passwords#create
#  cancel_user_registration GET    /users/cancel(.:format)         devise/registrations#cancel
#     new_user_registration GET    /users/sign_up(.:format)        devise/registrations#new
#    edit_user_registration GET    /users/edit(.:format)           devise/registrations#edit
#         user_registration PATCH  /users(.:format)                devise/registrations#update
#                           PUT    /users(.:format)                devise/registrations#update
#                           DELETE /users(.:format)                devise/registrations#destroy
#                           POST   /users(.:format)                devise/registrations#create
#                  api_base        /api                            API::Base
#       grape_swagger_rails        /apidoc                         GrapeSwaggerRails::Engine
#                      root GET    /                               home#index
# 
# Routes for OkComputer::Engine:
#              root GET|OPTIONS /                 ok_computer/ok_computer#show {:check=>"default"}
# okcomputer_checks GET|OPTIONS /all(.:format)    ok_computer/ok_computer#index
#  okcomputer_check GET|OPTIONS /:check(.:format) ok_computer/ok_computer#show
# 
# Routes for GrapeSwaggerRails::Engine:
#   root GET  /           grape_swagger_rails/application#index
# 
