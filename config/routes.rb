Rails.application.routes.draw do
  get 'products/show_all'

  get 'products/show'

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
