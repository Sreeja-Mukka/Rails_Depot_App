Rails.application.routes.draw do
  resources :numbers
  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  get 'admin/index'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :users
  scope '(:locale)' do
    resources :orders
    resources :line_items
    resources :carts
    root 'store#index', as: 'store_index' , via: :all
  end
  resources :support_requests, only: [ :index, :update ]
  resources :products do
    get :who_bought, on: :member
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
