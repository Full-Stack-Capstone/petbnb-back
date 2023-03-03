Rails.application.routes.draw do
  resources :users do
    resources :pet_rooms
    resources :pets
    resources :reservations
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pet_rooms#public"
end
