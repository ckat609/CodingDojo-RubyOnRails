class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :fname, presence: true, length: { minimum: 2}
  validates :lname, presence: true, length: { minimum: 2}
  validates :address, presence: true, length: { minimum: 2}
  validates :city, presence: true, length: { minimum: 2}
  validates :state, presence: true, length: { is: 2}
  validates :zipcode, presence: true, length: { minimum: 5}
  validates :email, presence: true, uniqueness: true, format: {with: EMAIL_REGEX}
  validates :password, presence: true

  has_secure_password
  has_many :restaurants, dependent: :destroy
  has_many :order_carts
  
  before_save :downcase_fields

  def downcase_fields
    self.email.downcase!
  end

end
