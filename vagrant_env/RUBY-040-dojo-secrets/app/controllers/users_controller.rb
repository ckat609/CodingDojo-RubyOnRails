class UsersController < ApplicationController
  skip_before_action :require_login, only:[:new, :create]
  
  def new
  end

  def create
    # user = User.new(name: user_params[:name], email: user_params[:email], password: user_params[:password])
    user = User.new(user_params)

    if user.save
      flash[:notice] = ["User #{user.name} (#{user.email}) created successfully!"]
      redirect_to sessions_new_path
    else
      flash[:errors] = user.errors.full_messages
      redirect_to users_new_path
    end
  end

  def show
    # @user = User.find(params[:id])
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
