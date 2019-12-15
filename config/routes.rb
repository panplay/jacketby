Rails.application.routes.draw do
  namespace :customer do
    get 'customers/edit'
    get 'customers/favorites'
  end
  root 'customer/items#index'
  get '/panda_and_coffee_with_ryoko_play/sign_in' => 'admins/sessions#new'
  post '/panda_and_coffee_with_ryoko_play/sign_in' => 'admins/sessions#create'
  get '/panda_and_coffee_with_ryoko_play/sign_out' => 'admins/sessions#destroy'

  devise_for :admins
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

   put "/items/:id" => "items#hide"
   resources :items, only: [:new, :create, :edit, :update, :index]
   resources :arrival_items, only: [:index, :new, :create]


    put "/customers/:id" => "customers#hide"
    resources :customers, only: [:index, :show, :update]
    resources :orders, only: [:index, :update]

  end

  namespace :customer do
    get 'homes/about' => "homes#about"
    get 'homes/thanks' => "homes#thanks"
    get 'homes/unsubscribe' => "homes#unsubscribe"

    resource :orders, only: [:new, :create]
    resources :cart, only: [:show, :create, :update, :destroy]
    resources :customers, only: [:edit]
    put "/customers/:id" => "customers#hide"
    get "/customers/:id" => "customers#favorite"

    resources :items, only: [:show, :index] do
      resource :favorites, only: [:create, :destroy]
    end

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
