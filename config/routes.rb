EummcrOrdering::Application.routes.draw do
  
  get 'settings', :to => 'settings#index', :as => :settings
  
  resources :orders
  
  root :to => 'orders#new'
  
end
