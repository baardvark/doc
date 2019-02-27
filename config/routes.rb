Rails.application.routes.draw do
  get 'appointments/index'
  get 'appointments/new'
  get 'appointment/index'
  get 'appointment/new'
  root 'doctors#index'

  resources :users
  resources :doctors do
    resources :appointments, only: [:index, :new, :create, :destroy]
  end
  end
