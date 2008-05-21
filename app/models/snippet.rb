class Snippet < ActiveRecord::Base
  validates_presence_of :name, :code
  acts_as_taggable
end
