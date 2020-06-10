class User < ActiveRecord::Base
    validates :first_name, presence: true, length: { in: 2..30}
    validates :last_name, presence: true, length: { in: 2..30}
    validates :favorite_language, presence: true, length: { in: 2..30}

    has_many :posts
end
