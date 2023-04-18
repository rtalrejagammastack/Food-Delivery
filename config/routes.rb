Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  
  # devise_scope :user do
  #   get 'registrations/show', to: "regisrations#show", as: 'user_show'
  #   # get 'session/on_signin', :to => 'sessions#memorize_session'
  # end

  root to: 'home#index'
  get 'home/show', to: 'home#show', as: 'home_show'
  resources :categories, only: :index
  resources :restaurants, only: [:index] do
    resources :foods, only: [:index, :show]
  end

  get "new_order_item", to: "order_items#new"
  resources :orders
  resources :order_items

   
  resources :carts
  resources :cart_items

  resources :admin_users, only: [:index]

  get 'account/orders', to: 'users#orders', as: 'user_orders'


  resources :addresses

  put '/addresses/:id/set_default', to: 'addresses#set_default', as: 'set_default_address'
  patch '/cart_items/:id/increment_quantity', to: 'cart_items#increment_quantity', as: 'increment_quantity'
  patch '/cart_items/:id/decrement_quantity', to: 'cart_items#decrement_quantity', as: 'decrement_quantity'

  
    # resources :cart_items do
    #   member do
    #     patch :increase_quantity
    #     patch :decrease_quantity
    #   end
    # end
  
end
