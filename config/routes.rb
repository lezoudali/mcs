require 'api_constraints'

Rails.application.routes.draw do
  
  devise_for :users
  
  namespace :api, defaults: {format: :json}, constraints: {subdomain: 'api'}, path: '/' do 
    scope module: :v1 do 
      resources :users, except: :index
      resources :sessions, only: [:create, :destroy]
    end
  end
end
