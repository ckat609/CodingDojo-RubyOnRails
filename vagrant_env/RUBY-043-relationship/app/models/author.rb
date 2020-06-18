class Author < ActiveRecord::Base
  belongs_to :book
  has_many :books
end
