class Dish < ActiveRecord::Base
  belongs_to :dishtype
  belongs_to :menu
  has_many :carts
  has_many :orders, through: :carts
end
