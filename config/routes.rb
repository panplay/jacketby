Rails.application.routes.draw do

  namespace :customer do
    get 'customers/edit'
    get 'customers/favorites'
  end

  root 'customers/items#index'
  get '/panda_and_coffee_with_ryoko_play/sign_in' => 'admins/sessions#new'
  post '/panda_and_coffee_with_ryoko_play/sign_in' => 'admins/sessions#create'
  get '/panda_and_coffee_with_ryoko_play/sign_out' => 'admins/sessions#destroy'

  devise_for :admins, controllers: {
    sessions: '/panda_and_coffee_with_ryoko_play/sign_in' => 'admins/sessions#new',
    passwords: '/panda_and_coffee_with_ryoko_play/sign_in' => 'admins/sessions#create'
    registrations: '/panda_and_coffee_with_ryoko_play/sign_out' => 'admins/sessions#destroy',

  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations',
  }

  namespace :admin do
    resources :categories, only: [:create, :update]
    put 'categories/:id/hide' => 'categories#hide', as: 'categories_hide'
    resources :labels, only: [:create, :update]
    put 'labels/:id/hide' => 'labels#hide', as: 'labels_hide'
    resources :artists, only: [:create, :update]
    put 'artists/:id/hide' => 'artists#hide', as: 'artists_hide'

    get 'homes/index' => 'homes#index'
    get "search" => "arrival_items#search"
    get "history_search" => "arrival_items#history_search"
    get "fav" => "items#fav"

   put "/items/:id" => "items#hide"
   resources :items, only: [:new, :create, :edit, :update, :index, :show]
   resources :arrival_items, only: [:index, :new, :create, :update]


    put "/customers/:id" => "customers#hide"
    resources :customers, only: [:index, :show, :update, :edit]
    resources :orders, only: [:index, :update]

  end

  namespace :customers do
    get 'homes/about' => "homes#about"
    get 'homes/thanks' => "homes#thanks"
    get ':id/unsubscribe' => "homes#unsubscribe", as: "unsubscribe"
    get "customers/:id/carts" => "customers#carts"
    get "search" => "items#search"
    get "category/:id" => "items#category"
    get "orders/new2" => "orders#new_address"

    resource :orders, only: [:new, :create]
    resources :customers, only: [:edit] do
      resources :carts, only: [:show, :create, :update, :destroy]
    end

    resources :customers, only: [:edit,:update]
    put "/customers/:id/hide" => "customers#hide", as: 'customers_hide'
    get "/customers/:id" => "customers#favorites", as: 'favorites'
    get "/items/index2" => "items#index2"

    resources :items, only: [:show, :index] do
      resource :favorites, only: [:create, :destroy]
      resources :carts, only: [:show, :create, :update, :destroy]
    end

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
