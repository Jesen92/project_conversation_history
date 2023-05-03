# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :projects do
    resources :comments, only: %w[create destroy]
    namespace :statuses do
      patch :update
    end
  end
  resources :projects
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'projects#index'
end
