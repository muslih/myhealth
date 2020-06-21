Rails.application.routes.draw do
  resources :users, only: [] do
    post 'signup', to: 'users#create', on: :collection
  end
  resources :appointments, only: [:create]

  resources :doctors
  resources :hospitals

  post '/login', to: "users#login"
end
