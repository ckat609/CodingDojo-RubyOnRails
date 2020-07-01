class Restaurant < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 2}
  validates :address, presence: true, length: { minimum: 2}
  validates :city, presence: true, length: { minimum: 2}
  validates :state, presence: true, length: { is: 2}
  validates :zipcode, presence: true, length: { minimum: 5}
  validates :description, presence: true, length: { minimum: 25}
  # validates :cuisine, presence: true

  has_many :menus, dependent: :destroy
  
  belongs_to :category
  belongs_to :user
end
