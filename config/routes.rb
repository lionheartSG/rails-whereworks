Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "listings#home"
  resources :users do
    member do
      get :bookings, :listings
    end
  end
  resources :listings do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:update, :edit, :show] do
    member do
      get :confirm, :cancel
    end
  end
end
