class Message < ActiveRecord::Base
  validates :author, :message, presence: true, length: {minimum: 15}

  belongs_to :post
end
