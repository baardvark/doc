Rails.application.routes.draw do
  devise_for :logins
  get 'appointments/index'
  get 'appointments/new'
  get 'appointment/index'
  get 'appointment/new'
  get 'doctors/index'
  root "accounts#index"
  

  resources :accounts

  resources :users
  resources :doctors do
    resources :appointments, only: [:index, :new, :create, :destroy]
  end
  end
