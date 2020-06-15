class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_REGEX }
  before_save :downcase_fields

  def downcase_fields
    self.email.downcase!
  end

  has_many :secrets
  has_many :likes
  has_many :secrets_liked, through: :likes, source: :secret
  has_secure_password
end
