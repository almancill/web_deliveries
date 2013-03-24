WebDeliveries::Application.routes.draw do
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
  resources :deliveries
  resources :reports

  get 'deliveries/search/:telephone_number' => 'deliveries#search', as: 'delivery_search'
  get 'customer/:id/address/:address_id/deliveries' => 'deliveries#customer_address_deliveries', as: 'customer_address_deliveries'
  get 'customer/:id/addresses' => 'addresses#customer_addresses', as: 'customer_address'
end