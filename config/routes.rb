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
    admin.resources :messages
    admin.resources :users
    admin.resources :uploads
    admin.resources :tracks
  end
  
  map.resources :albums
  map.resources :lyrics
  map.resources :participants
  map.resources :posts
  map.resources :reviews
  map.resources :contacts
  map.resources :messages
  map.resources :sessions
  map.resources :orders
  map.resources :tracks
  
  map.resources :orders, :member => { :confirm => :get }
  map.footy_songs "/footy_songs", :controller => "static_pages", :action => "footy_songs"
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
end
