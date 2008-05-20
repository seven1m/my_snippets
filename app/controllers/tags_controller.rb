class TagsController < ApplicationController
  def show
    if params[:id] =~ /^\d+$/
      @tag = Tag.find params[:id]
    else
      @tag = Tag.find_by_name params[:id]
    end
    @snippets = @tag.snippets.find(:all)
  end
end
