ActionController::Routing::Routes.draw do |map|
  map.resource :session
  map.snippets_by_owner 'snippets/:owner_url', :controller => 'snippets', :action => 'index', :conditions => {:method => :get}, :requirements => {:owner_url => /http.+/}
  map.resources :snippets, :has_many => 'comments'
  map.resources :tags
  map.resources :comments
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  map.connect '', :controller => 'snippets'
end
