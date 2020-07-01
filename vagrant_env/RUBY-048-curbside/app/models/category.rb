class Category < ActiveRecord::Base
    validates :name, presence: true, length: { minimum: 2}
    has_many :restaurants
end
