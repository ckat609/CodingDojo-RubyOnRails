class UsersController < ApplicationController
  before_action :require_user_edit_permissions, only:[:edit, :update, :destroy]
  skip_before_action :require_login, only:[:new, :create]
  def index
  end

  def new
  end

  def show
    @user = User.find(params[:id])
    puts "*"*50
    puts current_user.events.inspect
    puts "*"*50
  end
  
  def edit
    @user = User.find(params[:id])
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
      redirect_to sessions_new_path
    end
  end

  def update
    aUser = User.find(current_user.id)
    aUser.fname = register_params[:fname]
    aUser.lname = register_params[:lname]
    aUser.city = register_params[:city]
    aUser.state = register_params[:state]
    aUser.password = register_params[:password]
    aUser.password_confirmation = register_params[:password_confirmation]

    if aUser.save
      flash[:notice] = ["User modified successfully: #{aUser.fname} #{aUser.lname} in #{aUser.city}, #{aUser.state} on #{aUser.created_at.strftime("%m-%d-%Y")} "]
      redirect_to users_show_path
    else
      flash[:errors] = aUser.errors.full_messages
      redirect_to users_edit_path(current_user.id)
    end
  end

  def destroy
  end

  private
    def register_params
      params.require(:user).permit(:fname, :lname, :email, :city, :state, :password, :password_confirmation)
    end
end
