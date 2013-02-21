WebDeliveries::Application.routes.draw do

  get "customers/index"

  get "customers/new"

  get "customers/create"

  get "customers/edit"

  get "customers/update"

  root to: 'site#index'

  #Auth paths
  delete 'logout' => 'sessions#destroy', as: 'logout'
  
  #Restful routes
  resources :users
  resources :sessions, only: :create
end