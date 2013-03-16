WebDeliveries::Application.routes.draw do
  get "deliveries/index"

  get "deliveries/new"

  get "deliveries/create"

  get "deliveries/edit"

  get "deliveries/update"

  get "deliveries/destroy"

  root to: 'site#index'

  #Auth paths
  delete 'logout' => 'sessions#destroy', as: 'logout'
  
  #Restful routes
  resources :users
  resources :sessions, only: :create
  resources :customers do
  	resources :addresses
  end
  resources :telephones
  resources :addresses

end