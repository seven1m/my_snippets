ActionController::Routing::Routes.draw do |map|
  map.resource :session
  map.resources :snippets
  map.resources :tags
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  map.connect '', :controller => 'snippets'
end
