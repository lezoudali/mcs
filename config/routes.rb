require 'api_constraints'

Rails.application.routes.draw do
  
  devise_for :users
  
  namespace :api, defaults: {format: :json}, constraints: {subdomain: 'api'}, path: '/' do 
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do 

      resources :users, except: :index do 
        resources :videos, only: [:create, :update, :destroy]
      end
      resources :sessions, only: [:create, :destroy]

      resources :videos, only: [:show, :index] do 
        resources :comments, only: [:create, :update]
      end

      resources :comments, only: :destroy
    end
  end
end
