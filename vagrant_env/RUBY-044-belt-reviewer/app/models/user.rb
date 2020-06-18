class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :fname, presence: true
  validates :lname, presence: true
  validates :city, presence: true
  validates :state, presence: true, length: { is: 2 }
  validates :email, presence: true, uniqueness: true, format: {with: EMAIL_REGEX}
  validates :password, presence: true

  has_many :events
  has_many :attendings
  has_many :events_attending, through: :attendings, source: :event
  has_secure_password

  before_save :downcase_fields

  def downcase_fields
    self.email.downcase!
  end

end
