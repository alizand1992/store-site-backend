Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # General Routes
  resources :application, only: [:new]

  # Items
  resources :items, only: %i[index create]

  # Gallery
  resources :gallery, only: [:index]

end
