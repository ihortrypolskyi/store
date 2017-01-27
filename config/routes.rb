Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :orders
  resource :cart, only: [:show]
  resources :order_books, only: [:create, :update, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users
  get 'signup' => 'users#new'

  root 'books#index'

  get 'about/index'

  # get 'search', to: 'search#search'

  resources :books do
    resources :reviews, except: [:show, :index]
    collection do
      get 'search'
    end

    # member do
    #   post 'add_to_cart'
    # end
  end
  resources :categories
  resources :authors
  resources :publishers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
