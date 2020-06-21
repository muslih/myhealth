Rails.application.routes.draw do
  resources :users, only: [] do
    post 'signup', to: 'users#create', on: :collection
  end
  resources :appointments, only: [:create]

  resources :doctors do
    get 'appointments', on: :member
  end
  resources :hospitals

  post '/login', to: "users#login"
end
