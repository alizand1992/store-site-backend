Rails.application.routes.draw do
  root to: "application#index"

  devise_for :users, defaults: { format: :json }

  # General Routes
  resources :application, only: [:new, :index]
  get 'application/is_user_signed_in', to: 'application#is_user_signed_in?'
  get 'application/show_setup_wizard', to: 'application#show_setup_wizard?'

  # Items
  resources :items, only: %i[index show create update]
  get 'items/:id/images', to: 'items#images'
  get 'items/:id/image_data', to: 'items#image_data'
  post 'items/:id/images', to: 'items#save_images'
  post 'items/:id/select_thumbnail', to: 'items#select_thumbnail'

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
