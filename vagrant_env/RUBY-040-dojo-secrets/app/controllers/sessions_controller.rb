class SessionsController < ApplicationController
  def new
    # render login page
  end
  def create
    user = User.where(email: session_params[:email]).first
      if user
        if user.authenticate(session_params[:password])
          session[:user_id] = user.id
          redirect_to secrets_path#users_show_path(id: current_user)
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
    # session[:user_id] = nil
    session.clear
    redirect_to ""
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
