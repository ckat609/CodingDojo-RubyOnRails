class Message < ActiveRecord::Base
  validates :message, presence: true, length: { minimum: 10}

  belongs_to :user
end
