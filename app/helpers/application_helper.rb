# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  include TagsHelper
  
  def signed_in?
    session[:url]
  end
  
  def is_admin?
    signed_in? and ADMINS.include? session[:url]
  end
  
  def can_edit?(snippet)
    signed_in? and (is_admin? or snippet.owner_url == session[:url])
  end
end
