Rails.application.routes.draw do
  namespace :admin do
    get 'categories/create'
    get 'categories/update'
    get 'categories/hide'
  end
  namespace :admin do
    get 'labels/create'
    get 'labels/update'
    get 'labels/hide'
  end
  namespace :admin do
    get 'artists/create'
    get 'artists/update'
    get 'artists/hide'
  end
  namespace :admin do
    get 'homes/index'
  end
  namespace :admin do
    get 'orders/index'
    get 'orders/update'
  end
  namespace :admin do
    get 'customers/show'
    get 'customers/hide'
    get 'customers/index'
    get 'customers/update'
  end
  namespace :admin do
    get 'arrival_items/index'
    get 'arrival_items/new'
    get 'arrival_items/create'
  end
  namespace :admin do
    get 'items/new'
    get 'items/create'
    get 'items/edit'
    get 'items/update'
    get 'items/hide'
  end
  namespace :customer do
    get 'homes/about'
    get 'homes/thanks'
    get 'homes/unsubscribe'
  end
  namespace :customer do
    get 'carts/show'
    get 'carts/create'
    get 'carts/update'
    get 'carts/destroy'
  end
  namespace :customer do
    get 'favorites/create'
    get 'favorites/destroy'
  end
  namespace :customer do
    get 'orders/new'
    get 'orders/create'
  end
  namespace :customer do
    get 'items/index'
    get 'items/show'
  end
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
