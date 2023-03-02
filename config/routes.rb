Rails.application.routes.draw do
  resources :reservations
  resources :pet_rooms
  resources :pets
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
