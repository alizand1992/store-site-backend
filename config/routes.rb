Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "application#index"

  # General Routes
  resources :application, only: [:new, :index]

  # Items
  resources :items, only: %i[index show create update]
  get 'items/:id/images', to: 'items#images'
  get 'items/:id/image_data', to: 'items#image_data'
  post 'items/:id/images', to: 'items#save_images'

  # Item Attributes
  resources :item_attributes, only: [:create]
  get 'item_attributes/:item_id', to: 'item_attributes#index'

  # Gallery
  resources :gallery, only: [:index]

  # Site Properties
  resources :site_properties, only: [:index]
  put 'site_properties', to: 'site_properties#update_all'

  # Posts
  resources :posts, only: [:index, :show, :create, :update]
end
