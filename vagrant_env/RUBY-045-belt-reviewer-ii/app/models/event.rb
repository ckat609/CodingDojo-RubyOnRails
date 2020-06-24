class Event < ActiveRecord::Base
  validates :name, presence: true
  validates :date, presence: true
  validates :city, presence: true
  validates :state, presence: true


  belongs_to :user

  validate :date_cannot_be_in_the_past

  def date_cannot_be_in_the_past
    if date.present? && date <= Date.today
      errors.add(:date, "can't be in the past")
    end
  end    

  has_many :comments
  has_many :attendings
  has_many :users_attending, through: :attendings, source: :user
end
