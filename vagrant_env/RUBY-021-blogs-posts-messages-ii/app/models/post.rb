class Post < ActiveRecord::Base
  has_many :messages
  has_many :comments, as: :commentable
  
  belongs_to :user
  belongs_to :blog
end
