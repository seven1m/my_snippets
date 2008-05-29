class CommentsController < ApplicationController
  def new
    @snippet = Snippet.find params[:snippet_id]
    respond_to do |format|
      format.html
      format.js { render :layout => false }
    end
  end
  
  def create
    @snippet = Snippet.find params[:snippet_id]
    @snippet.comments.create params[:comment].merge(:owner_url => session[:url])
    redirect_to snippet_path(@snippet)
  end
  
  verify :only => %w(new edit create update destroy), :session => :url,
    :render => {:text => 'You are not signed in.', :layout => true}
  
  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy if can_edit? @comment
    redirect_to snippet_path(@comment.snippet_id)
  end
  
end
