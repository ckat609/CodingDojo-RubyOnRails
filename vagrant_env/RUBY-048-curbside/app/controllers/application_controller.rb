class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login
  # add next line to other controllers to allow access and not cause infinite loop
  # skip_before_action :require_login, only:[:new, :create]

  # add next line to edit controllers to prevent edits/destroys by unauthorized users
  # before_action :require_event_edit_permissions, only:[:edit, :destroy]

  def current_user
    return User.find(session[:userid]) if session[:userid]
  end

  def require_login 
    unless current_user
      flash[:errors] = ["You must be logged in to access this section"]
      redirect_to sessions_new_path
    end
  end

  def require_restaurant_edit_permissions
    restaurant = Restaurant.find_by_id(params[:id])
    if restaurant
      unless current_user.id == restaurant.user.id
        flash[:errors] = ["You don't have permission to modifiy this!"]
        redirect_to restaurants_new_path
      end
    end
    return true
  end

  helper_method :current_user
end
