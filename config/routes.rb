Rails.application.routes.draw do
  root "seats#index"
  get 'qrcode' => "qrcode#index", as: :qrcode
  get 'search/users'
  devise_for :users,
    only: [:sessions, :registrations],
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
    }

  resources :seats
  resources :bookings
  resources :checkins
  # root "chats#index"
  # resources :chats do
  #   resources :messages, only: [:create]
  # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
end
