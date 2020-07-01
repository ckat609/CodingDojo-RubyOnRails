class Dish < ActiveRecord::Base
  belongs_to :dishtype
  belongs_to :menu
end
