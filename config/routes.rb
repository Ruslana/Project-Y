ActionController::Routing::Routes.draw do |map|
  
  map.root :controller => "home"
  map.login 'admin', :controller => "admin/home", :action => "title"
  
  map.namespace :admin do |admin|
    admin.resources :albums
    admin.resources :lyrics
    admin.resources :participants
    admin.resources :posts
    admin.resources :reviews
    admin.resources :contacts
    admin.resources :orders
    admin.resources :order_transactions
    admin.resources :messages
  end
  
  map.resources :albums
  map.resources :lyrics
  map.resources :participants
  map.resources :posts
  map.resources :reviews
  map.resources :contacts
  map.resources :orders
  map.resources :order_transactions
  map.resources :messages
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
end
