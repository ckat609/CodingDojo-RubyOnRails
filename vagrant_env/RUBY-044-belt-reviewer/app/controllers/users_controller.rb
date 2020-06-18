class UsersController < ApplicationController
  skip_before_action :require_login, only:[:new, :create]
  def index
  end

  def new
  end

  def show
  end

  def edit
  end

  def create
    aUser = User.new(register_params)
    puts "*"*50
    puts aUser.inspect
    puts "*"*50

    # if aUser.save
    if aUser.update(register_params)
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
    aUser.email = register_params[:email]
    aUser.city = register_params[:city]
    aUser.state = register_params[:state]
    aUser.password = register_params[:password]
    aUser.password_confirmation = register_params[:password_confirmation]
    puts "*"*50
    puts aUser.inspect
    puts "*"*50
    
    if aUser.save
      puts "*"*50
      puts "YAY"
      puts "*"*50
      flash[:notices] = ["User #{aUser.fname} #{aUser.lname} (#{aUser.email}) updated successfully!"]
      redirect_to users_show_path
      # session[:userid] = aUser.id
      # redirect_to users_show_path #uncomment to login right after successful registration
    else
      puts "*"*50
      puts "SUCKS"
      puts "*"*50
      flash[:errors] = aUser.errors.full_messages
      redirect_to users_edit_path
    end
  end

  def destroy
  end

  private
    def register_params
      params.require(:user).permit(:fname, :lname, :email, :city, :state, :password, :password_confirmation)
    end
end
