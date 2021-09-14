Rails.application.routes.draw do

  resources :customers, only: [:show, :edit, :update, :destroy] do
    get '/confirm' => 'customers#confirm', as: "confirm"
    resources :delivery_addresses, only: [:index, :edit, :update, :destroy, :create]
    resources :cart_items, only: [:create, :index, :update, :destroy]
    delete '/cart_items' => 'cart_items#all_destroy'
    resources :orders, only: [:create, :index, :show]
    get '/orders/confirm' => 'orders#confirm'
    get '/orders/complete' => 'orders#complete'
  end

  resources :items, only: [:index, :show]
  get '/search' => "searches#search", as: "search"

  root :to =>'homes#top'
  get 'homes/about'


  namespace :admin do
    resources :admins, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, except: [:destroy]
    resources :orders, only: [:show, :index, :update]
    resources :order_items, only: [:update]
  end



  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
