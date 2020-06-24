class Person < ActiveRecord::Base
    has_many :partners, class_name: "Person", foreign_key: 'partner_id'

    belongs_to :partner, class_name: "Person"
end
