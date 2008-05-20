class SnippetsController < ApplicationController
  def index
    order = params[:order] || 'created_at desc'
    @snippets = Snippet.find(:all, :order => order)
  end
  
  def show
    @snippet = Snippet.find params[:id]
  end
end
