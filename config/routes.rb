Rails.application.routes.draw do

  get  'index' =>'contact_mailers#index'
  post 'confirm' => 'contact_mailers#confirm'
  post 'done' => 'contact_mailers#done'
  resources :contacts, only: [:index, :new, :create, :edit, :update]

  namespace :customer do
    get 'customers/edit'
    get 'customers/favorites'
  end

  root 'customers/items#index'
  devise_for :admins, path: 'auth', path_names: { sign_in: 'panda_and_coffee_with_ryoko_play_login', sign_out: 'panda_and_coffee_with_ryoko_play_logout', password: 'panda_and_coffee_with_ryoko_play_secret', confirmation: 'panda_and_coffee_with_ryoko_play_verification', unlock: 'panda_and_coffee_with_ryoko_play_unblock', registration: 'panda_and_coffee_with_ryoko_play_register', sign_up: 'panda_and_coffee_with_ryoko_play_cmon_let_me_in' }, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations',
  }

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

    resource :orders, only: [:new, :create] do
      post :pay, on: :member
    end

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
      resources :post_comments, only: [:create, :destroy, :edit, :update]
    end

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
