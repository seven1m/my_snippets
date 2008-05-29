class Comment < ActiveRecord::Base
  belongs_to :snippet
end
