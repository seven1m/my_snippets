ActionController::Routing::Routes.draw do |map|
  map.resources :snippets
  map.resources :tags
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end