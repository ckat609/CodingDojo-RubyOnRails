class Relationship < ActiveRecord::Base
  belongs_to :boyfriend, class_name: "Person"
  belongs_to :girlfriend, class_name: "Person"
end
