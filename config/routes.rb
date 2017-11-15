Rails.application.routes.draw do
  root to: 'products#show_all', as: 'root'

  get '/products', to: 'products#show_all', as: 'show_all'

  get 'products/:id', to: 'products#show', as: 'product', id: /\d+/

  get 'products/:name', to: 'products#category_show', as: 'category_products'

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
