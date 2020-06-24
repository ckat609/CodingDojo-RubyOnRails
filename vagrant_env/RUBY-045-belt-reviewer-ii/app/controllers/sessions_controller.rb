class SessionsController < ApplicationController
  skip_before_action :require_login, only:[:new, :create]
  
  def index
  end

  def new
  end

  def create
    aUser = User.where(email: session_params[:email]).first
    puts "*"*50
    puts aUser.inspect
    puts "*"*50
    if aUser
      if aUser.authenticate(session_params[:password])
        session[:userid] = aUser.id
        redirect_to events_index_path
      else
        flash[:errors] = ["Invalid password"]
        redirect_to sessions_new_path
      end
    else
      flash[:errors] = ["Invalid email"]
      redirect_to sessions_new_path
    end
  end

  def destroy
    session[:userid] = nil
    redirect_to sessions_new_path
  end

  private
    def session_params
      params.require(:user).permit(:email, :password)
    end
end
