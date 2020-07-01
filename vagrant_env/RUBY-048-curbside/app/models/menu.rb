class Menu < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 2}
  validates :restaurant, presence: true
  
  has_many :dishtypes
  belongs_to :restaurant
end
