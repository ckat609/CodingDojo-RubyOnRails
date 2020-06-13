class User < ActiveRecord::Base
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

    validates :fname, presence: true
    validates :lname, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: EMAIL_REGEX }
    validates :password, presence: true, length: { minimum: 4}

    has_many :messages
end
