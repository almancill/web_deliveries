WebDeliveries::Application.routes.draw do

  root to: 'site#index'

  #Auth paths
  delete 'logout' => 'sessions#destroy', as: 'logout'
  
  #Restful routes
  resources :users
  resources :sessions, only: :create
  resources :customers
end