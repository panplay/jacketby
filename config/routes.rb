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
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }

  namespace :admin do
    resources :categories, only: [:create, :update]
    put 'categories/hide'
    resources :labels, only: [:create, :update]
    put 'labels/hide'
    resources :artists, only: [:create, :update]
    put 'artists/hide'

    get 'homes/index' => 'homes#index'
    get "search" => "arrival_items#search"
    get "history_search" => "arrival_items#history_search"

   put "/items/:id" => "items#hide"
   resources :items, only: [:new, :create, :edit, :update, :index]
   resources :arrival_items, only: [:index, :new, :create, :update]


    put "/customers/:id" => "customers#hide"
    resources :customers, only: [:index, :show, :update, :edit]
    resources :orders, only: [:index, :update]

  end

  namespace :customers do
    get 'homes/about' => "homes#about"
    get 'homes/thanks' => "homes#thanks"
    get 'homes/unsubscribe' => "homes#unsubscribe"
    get "customers/:id/carts" => "customers#carts"
    get "search" => "items#search"
    get "category/:id" => "items#category"

    resource :orders, only: [:new, :create]
    resources :customers, only: [:edit] do
      resources :carts, only: [:show, :create, :update, :destroy]
    end

    put "/customers/:id" => "customers#hide"
    resources :customers, only: [:edit,:update]
    put "/customers/:id" => "customers#hide"
    get "/customers/:id" => "customers#favorites", as: 'favorites'
    get "/items/index2" => "items#index2"

    resources :items, only: [:show, :index] do
      resource :favorites, only: [:create, :destroy]
      post "/favorites1" => "favorites#create1"
      post "/favorites2" => "favorites#create2"
      delete "/favorites1" => "favorites#destroy1"
      delete "/favorites2" => "favorites#destroy2"

      resources :carts, only: [:show, :create, :update, :destroy]
    end

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
