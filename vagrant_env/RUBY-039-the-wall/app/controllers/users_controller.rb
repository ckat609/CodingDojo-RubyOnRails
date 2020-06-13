class UsersController < ApplicationController
  def index
  end

  def new
    
  end

  def show

  end

  def create
    user = User.new(user_params)

    if user.save 
      flash[:notice] = ['User successfully created']
      user.save
      session[:user_id] = user.id
    else
      flash[:errors] = user.errors.full_messages
    end
    redirect_to users_new_path
  end

  def login
    user = User.find_by(email: login_params[:email])

    if user.blank?
      flash[:errors] = ["Email doesn't exist in our records"]
      redirect_to users_new_path
    else
      if user.password == login_params[:password]
        session[:user_id ]= user.id
        redirect_to messages_index_path
      else
        flash[:errors] = ["Incorrect password"]
        redirect_to users_new_path
      end
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to root_path
  end



  private

  def user_params
    params.require(:user).permit(:fname, :lname, :email, :password)
  end

  def login_params
    params.require(:login).permit(:email, :password)
  end
end
