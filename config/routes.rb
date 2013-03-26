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
  resources :telephones, only: [:create, :update, :edit, :destroy]
  resources :addresses, only: [:new, :create, :update, :show, :destroy]
  resources :deliveries
  resources :reports, only: [:index]
  #resources :passwords, only: [:edit, :update]

  get 'deliveries/search/:telephone_number' => 'deliveries#search', as: 'delivery_search'
  get 'customer/:id/address/:address_id/deliveries' => 'deliveries#customer_address_deliveries', as: 'customer_address_deliveries'
  get 'customer/:id/addresses' => 'addresses#customer_addresses', as: 'customer_address'
  get 'reports/:date' => 'reports#obtain', as: 'daily_report'
  get 'passwords/edit' => 'passwords#edit', as: 'password_edit'
  put 'passwords/:user_id' => 'passwords#update', as: 'password_update'
end