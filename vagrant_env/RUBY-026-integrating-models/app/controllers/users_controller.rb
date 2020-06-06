class UsersController < ApplicationController
  def index
    @users = User.all.select(:id, :first_name, :last_name, :created_at, :updated_at)
    # render :json => @users
  end

  def new
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def create
    User.create(user_params)
    redirect_to users_path()
  end
  
  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_url(id: params[:id])
  end

  def total
    @user = User.all().count()
  end

  private
  
    def user_params
      params.require(:user).permit(:first_name, :last_name)
    end
end

