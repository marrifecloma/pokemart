Rails.application.routes.draw do
  get 'pages/about'

  root to: 'products#show_all', as: 'root'

  get '/products', to: 'products#show_all', as: 'show_all'
  get 'products/:id', to: 'products#show', as: 'product', id: /\d+/
  get 'products/:name', to: 'products#category_show', as: 'category_products'

  get '/cart', to: 'carts#show', as: 'show_cart'
  get '/cart/checkout', to: 'carts#preview_order', as: 'preview_order'
  post '/add_to_cart/:product_id' => 'carts#add_to_cart', :as => 'add_to_cart'
  post '/delete_from_cart/:product_id' => 'carts#delete_from_cart', :as => 'delete_from_cart'
  match '/show', to: 'carts#update_cart_item', via: 'post'

  get '/about', to: 'pages#page', as: 'about'
  get '/contact', to: 'pages#page', as: 'contact'

  match '/cart/checkout', to: 'customers#customer_info', via: 'post'

  resources :carts
  resources :products
  resources :cart_items

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
