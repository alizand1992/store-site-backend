Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Items
  resources :items, only: [:index]

  # Gallery
  resources :gallery, only: [:index]

end
