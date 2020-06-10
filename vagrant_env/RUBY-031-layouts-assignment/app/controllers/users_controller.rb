class UsersController < ApplicationController
  layout "two_column"

  def index
    @users = User.all
  end

  def show
  end

  def create
    user = User.create(user_params)
    if user.valid?
      flash[:success] = "#{user.first_name} #{user.last_name} has been successfully added!"
    else
      flash[:errors] = user.errors.full_messages
    end
    redirect_to root_url
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :favorite_language)
  end
end
