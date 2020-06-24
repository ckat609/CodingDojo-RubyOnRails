class UsersController < ApplicationController
  skip_before_action :require_login, only:[:new, :create]
  
  def index
  end

  def new
  end

  def show
    if current_user.user_type == "borrower"
      @lenders = current_user.lenders
      @loans = Loan.where(borrower: current_user)
    else
      # @borrowers = User.where(user_type: "borrower").joins("left outer join loans as lo on users.id = lo.borrower_id").group("lo.borrower_id").where("lo.lender_id != #{current_user.id}")
      # @borrowers = Loan.where.not(borrower_id: Loan.select(:borrower_id).where(lender: current_user).group(:borrower_id))


      loan = Loan.select(:borrower_id).where(lender: current_user).group(:borrower_id)
      loan2 = Loan.where.not(borrower_id: loan).group(:borrower_id)
      # @borrowers = loan2.select("*").joins("join users on users.id = loans.borrower_id")

      # @borrowers = Loan.where.not(borrower_id: Loan.select(:borrower_id).where(lender: current_user).group(:borrower_id)).group(:borrower_id).select("*").joins("join users on users.id = loans.borrower_id")
      @allBorrowers = User.where(user_type: "borrower").where.not(id: current_user.borrowers.to_a)


      @borrowers = current_user.borrowers
      @borrowers.each do |borrow|
        borrow.total = current_user.get_total_by_borrower borrow
      end
      
      puts "*"*50
      puts @borrowers
      puts "*"*50

      @loans = Loan.all
    end
  end

  def edit
  end

  def create
    aUser = User.new(register_params)

    if aUser.save
      flash[:notices] = ["User #{aUser.fname} #{aUser.lname} - #{aUser.user_type} - $#{aUser.money} - (#{aUser.email}) created successfully!"]
      redirect_to sessions_new_path
    else
      flash[:errors] = aUser.errors.full_messages
      redirect_to users_new_path
    end
  end

  def update
  end

  def destroy
  end

  private
    def register_params
      params.require(:user).permit(:fname, :lname, :email, :money, :reason, :description, :user_type, :password, :password_confirmation)
    end
end
