class LoansController < ApplicationController
  def index
  end

  def create
    flash[:errors] = []
    flash[:notice] = []

    borrower = User.find(params[:id])
    lender = User.find(current_user.id)

    if loan_params[:amount].to_i > lender.money
      flash[:errors] << "Not enough balance to lend that amount"
      redirect_to users_show_path
    else

      if lender.update_attribute(:money, lender.money - loan_params[:amount].to_i)
        flash[:notice] << "Transfer"
      else
        flash[:errors] << lender.errors.full_messages
      end

      loan = Loan.new()
      loan.lender = current_user
      loan.borrower = borrower
      loan.amount = loan_params[:amount]
  
      if loan.save
        flash[:notice] << "$#{loan.amount} transferred successfully to #{borrower.fname} #{borrower.lname}!"
      else
        flash[:errors] = loan.errors.full_messages
      end

      redirect_to users_show_path
    end
  end

  def destroy
  end

  private
    def loan_params
      params.require(:loan).permit(:amount)
    end
end
