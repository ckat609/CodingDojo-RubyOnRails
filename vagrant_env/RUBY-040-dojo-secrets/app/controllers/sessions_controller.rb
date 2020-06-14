class SessionsController < ApplicationController
  def new
    # render login page
  end
  def create
    user = User.where(email: session_params[:email]).first
    puts "*"*50
    puts user.inspect
    puts "*"*50
      if user
        if user.authenticate(session_params[:password])
          session[:user_id] = user.id
          redirect_to users_show_path
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
      session[:user_id] = nil
      redirect_to sessions_new_path
  end

  private

  def session_params
    params.require(:login).permit(:email, :password)
  end
end
