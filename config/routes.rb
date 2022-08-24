Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "listings#home"
  resources :users
  resources :listings do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:update, :edit, :show]
end
