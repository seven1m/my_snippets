class TagsController < ApplicationController
  def index
    @tags = Snippet.tag_counts
  end
  
  def show
    @tag = params[:id].downcase
    @snippets = Snippet.find_tagged_with(@tag)
  end
end
