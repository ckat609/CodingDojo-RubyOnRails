class UsersController < ApplicationController
  skip_before_action :require_login, only:[:new, :create]
  
  def index
  end

  def new
  end

  def show
  end
  
  def edit
    @user = User.find(current_user.id)
  end

  def create
    aUser = User.new(register_params)

    if aUser.save
      flash[:notices] = ["User #{aUser.fname} #{aUser.lname} (#{aUser.email}) created successfully!"]
      redirect_to sessions_new_path
      # session[:userid] = aUser.id
      # redirect_to users_show_path #uncomment to login right after successful registration
    else
      flash[:errors] = aUser.errors.full_messages
      redirect_to users_new_path
    end
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(register_params)
      flash[:notices] = ["User #{@user.fname} #{@user.lname} (#{@user.email}) updated successfully!"]
      redirect_to users_edit_path
      # session[:userid] = aUser.id
      # redirect_to users_show_path #uncomment to login right after successful registration
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to users_edit_path
    end
  end

  def destroy
  end

  private
    def register_params
      params.require(:user).permit(:fname, :lname, :email, :address, :city, :state, :zipcode, :password, :password_confirmation)
    end
end
