class Snippet < ActiveRecord::Base
  validates_presence_of :name, :body
  acts_as_taggable
end
