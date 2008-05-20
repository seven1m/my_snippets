class Snippet < ActiveRecord::Base
  has_and_belongs_to_many :tags
  
  after_save :update_tags
    
  def update_tags
    tags_string.split.each do |t|
      tag = Tag.find_or_create_by_name(t)
      tags << tag
    end
  end
end
