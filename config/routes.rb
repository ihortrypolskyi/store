Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resource :orders
  resource :carts, only: [:show]
  resources :order_books, only: [:create, :update, :destroy]

  resources :sessions, only: [:new, :create, :destroy]
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users
  get 'signup' => 'users#new'


  root 'books#index'

  get 'publishers/new'

  get 'publishers/create'

  get 'publishers/update'

  get 'publishers/edit'

  get 'publishers/destroy'

  get 'publishers/show'

  get 'publishers/index'

  get 'authors/new'

  get 'authors/create'

  get 'authors/update'

  get 'authors/edit'

  get 'authors/destroy'

  get 'authors/show'

  get 'authors/index'

  get 'categories/new'

  get 'categories/create'

  get 'categories/update'

  get 'categories/edit'

  get 'categories/destroy'

  get 'categories/show'

  get 'categories/index'

  get 'books/new'

  get 'books/create'

  get 'books/update'

  get 'books/edit'

  get 'books/destroy'

  get 'books/show'

  get 'books/index'

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
