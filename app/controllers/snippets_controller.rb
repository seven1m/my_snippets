class SnippetsController < ApplicationController
  def index
    order = params[:order] || 'created_at desc'
    conditions = {}
    @by = conditions[:owner_url] = params[:owner_url] if params[:owner_url]
    @snippets = Snippet.find(:all, :order => order, :conditions => conditions)
  end
  
  def show
    @snippet = Snippet.find params[:id]
  end
  
  verify :only => %w(new edit create update destroy), :session => :url,
    :render => {:text => 'You are not signed in.', :layout => true}
  
  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.new
    if @snippet.update_attributes params[:snippet].merge(:owner_url => session[:url])
      redirect_to @snippet
    else
      render :action => 'new'
    end
  end
  
  def edit
    @snippet = Snippet.find params[:id]
  end

  def update
    @snippet = Snippet.find params[:id]
    if not can_edit? @snippet
      flash[:notice] = 'You cannot edit this snippet.'
      redirect_to snippet_path(@snippet)
    elsif @snippet.update_attributes params[:snippet].merge(:owner_url => session[:url])
      redirect_to @snippet
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @snippet = Snippet.find params[:id]
    @snippet.destroy if can_edit? @snippet
    redirect_to snippets_path
  end
end
