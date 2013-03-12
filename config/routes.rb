WebDeliveries::Application.routes.draw do

  get "telephones/create"

  get "telephones/edit"

  get "telephones/update"

  get "telephones/destroy"

  root to: 'site#index'

  #Auth paths
  delete 'logout' => 'sessions#destroy', as: 'logout'
  
  #Restful routes
  resources :users
  resources :sessions, only: :create
  resources :customers
  resources :telephones
end