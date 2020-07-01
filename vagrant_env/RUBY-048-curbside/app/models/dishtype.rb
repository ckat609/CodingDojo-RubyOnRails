class Dishtype < ActiveRecord::Base
    validates :name, presence: true, length: { minimum: 2}

    belongs_to :menu
end
