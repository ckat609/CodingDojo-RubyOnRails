class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :fname, presence: true
  validates :lname, presence: true
  validates :email, presence: true, uniqueness: true, format: {with: EMAIL_REGEX}
  validates :money, presence: true, numericality: { only_integer: true }
  validates :reason, presence: true
  validates :description, presence: true
  validates :user_type, inclusion: { in: ["lender", "borrower"] }
  validates :password, presence: true

  has_many :loans, foreign_key: :lender_id, class_name: "Loan"
  has_many :borrows, foreign_key: :borrower_id, class_name: "Loan"

  has_many :lenders, through: :borrows
  has_many :borrowers, through: :loans


  has_secure_password

  before_save :downcase_fields

  def downcase_fields
    self.email.downcase!
  end

  def get_total_by_borrower borrower
    Loan.where(borrower: borrower, lender: self).sum(:amount)
  end

  def get_raised
    Loan.where(borrower: self).sum(:amount)
  end

  @allowed_types = ["lender", "borrower"]

end
