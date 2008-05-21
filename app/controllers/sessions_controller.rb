require 'openid/store/filesystem'

class SessionsController < ApplicationController
  def new
    # login page
  end
  
  def create
    # login form submission
    store = OpenID::Store::Filesystem.new(RAILS_ROOT + '/tmp/openid')
    consumer = OpenID::Consumer.new(session, store)
    oid_req = consumer.begin params[:url]
    realm = request.protocol + request.host_with_port
    return_to = session_url
    redirect_to oid_req.redirect_url(realm, return_to)
  end
  
  def show
    # fake it
    update
  end
  
  def update
    # back from openid provider
    store = OpenID::Store::Filesystem.new(RAILS_ROOT + '/tmp/openid')
    consumer = OpenID::Consumer.new(session, store)
    url = request.protocol + request.host_with_port + request.relative_url_root + request.path
    response = consumer.complete(params.reject { |k, v| k !~ /^openid\./ }, url)
    if response.status == :success
      session[:url] = response.identity_url
      redirect_to snippets_path
    else
      flash[:notice] = 'Failure signing in with OpenID.'
      redirect_to new_session_path
    end
  end
end
