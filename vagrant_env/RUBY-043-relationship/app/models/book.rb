class Book < ActiveRecord::Base
  belongs_to :author
  has_many :authors

  has_many :loans
  has_many :users, through: :loans
end
