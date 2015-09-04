require 'api_constraints'

Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'api/v1/users/sessions',
    registrations: 'api/v1/users/registrations'
  }

  namespace :api, defaults: {format: :json}, path: '/' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :users, except: :index do
        resources :videos, only: [:create, :update, :destroy]
      end
      resources :sessions, only: [:create, :destroy]

      resources :videos, only: [:show, :index] do
        resources :comments, only: [:create, :update]
        resources :video_likes, only: :create
      end

      resources :comments, only: :destroy
      resources :video_likes, only: :destroy
    end
  end
end
