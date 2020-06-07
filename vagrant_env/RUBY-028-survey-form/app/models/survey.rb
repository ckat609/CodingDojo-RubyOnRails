class Survey < ActiveRecord::Base
  belongs_to :dojo
  belongs_to :language
end
