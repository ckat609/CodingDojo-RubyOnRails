class Post < ActiveRecord::Base
  validates :title, presence: true, length: {minimum: 7}

  belongs_to :blog
  has_many :messages, dependent: :delete_all
end
