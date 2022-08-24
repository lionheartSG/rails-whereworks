Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "listings#index"
  resources :listings, only: %i[ index show new create]
  resources :users
end
