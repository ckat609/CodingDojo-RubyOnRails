class Dojo < ActiveRecord::Base
    validates :branch, :street, :city, :state, presence: true
    validates :branch, :street, :city, length: {in: 2..30}
    validates :state, length: {maximum: 2}

    has_many :students
end
