Rails.application.routes.draw do
  namespace :projects do
    namespace :statuses do
      patch :update
    end
  end
  resources :projects
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "projects#index"
end
