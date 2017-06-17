Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount API::Base, at: '/api'
  mount GrapeSwaggerRails::Engine, at: '/apidoc'

  root to: 'home#index'
end
