Rails.application.routes.draw do
  get 'hospital/index'
  get 'doctor/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:create]
  resources :appointments, only: [:create]

  resources :doctors
  resources :hospitals

  post '/login', to: "users#login"
end
