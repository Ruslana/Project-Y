ActionController::Routing::Routes.draw do |map|
  map.namespace :admin do |admin|
    admin.resources :albums
    admin.resources :lyrics
    admin.resources :participants
    admin.resources :posts
    admin.resources :reviews
    admin.resources :photos
  end
  
  map.resources :albums
  map.resources :lyrics
  map.resources :participants
  map.resources :posts
  map.resources :reviews
  map.resources :photos
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
