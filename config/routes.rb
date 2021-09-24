Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }

  resources :customers, only: [:show, :edit, :update]
  patch '/leave' => 'customers#leave', as: "leave"
  get '/confirm' => 'customers#confirm', as: "confirm"
  resources :cart_items, only: [:create, :index, :update, :destroy] do
    collection do
      delete '/destroy_all' => 'cart_items#destroy_all'
    end
  end
  get '/orders/complete' => 'orders#complete'
  post '/orders/confirm' => 'orders#confirm'
  get '/orders/confirm' => 'orders#error'
  resources :orders, only: [:create, :index, :show, :new]

  resources :delivery_places, only: [:index, :edit, :update, :destroy, :create]
  resources :items, only: [:index, :show]
  get '/search/genres/:id' => "searches#genre", as: "genre_search"
  get '/search' => "searches#word", as: "word_search"

  root to: 'homes#top'
  get 'homes/about'


  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, except: [:destroy]
    resources :orders, only: [:show, :update]
    resources :order_items, only: [:update]
    get '/search' => "searches#search", as: "search"
    get '/orders/:id/index' => "orders#index", as: "order_index"
    root to: 'homes#top'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
