class Dishtype < ActiveRecord::Base
    validates :name, presence: true, length: { minimum: 2}
    has_many :dishes
    belongs_to :menu
end
