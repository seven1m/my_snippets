class SnippetsController < ApplicationController
  def index
    order = params[:order] || 'created_at desc'
    @snippets = Snippet.find(:all, :order => order)
  end
  
  def show
    @snippet = Snippet.find params[:id]
  end
  
  def new
    @snippet = Snippet.new
  end
  
  def edit
    @snippet = Snippet.find params[:id]
  end
  
  def create
    @snippet = Snippet.new
    if @snippet.update_attributes params[:snippet]
      redirect_to @snippet
    else
      render :action => 'new'
    end
  end
  
  def update
    @snippet = Snippet.find params[:id]
    if @snippet.update_attributes params[:snippet]
      redirect_to @snippet
    else
      render :action => 'edit'
    end
  end
end
