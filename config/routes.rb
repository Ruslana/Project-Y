ActionController::Routing::Routes.draw do |map|
  
  map.root :controller => "posts" 
  
  map.namespace :admin do |admin|
    admin.resources :albums
    admin.resources :lyrics
    admin.resources :participants
    admin.resources :posts
    admin.resources :reviews
  end
  
  map.resources :albums
  map.resources :lyrics
  map.resources :participants
  map.resources :posts
  map.resources :reviews
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
end
